import pytorch_lightning as pl

import torch
from torch import nn
from torch.nn import functional as F

from torchmetrics import Accuracy

from torchvision import transforms

import torchvision
import torchvision.models as models

import coremltools as ct

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

'''
version_22:
    - preprocess_train = transforms.Compose([
        transforms.Resize(256),
        transforms.CenterCrop(224),
        transforms.RandAugment(3),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
        ])
    - transfer = false -> fine tunning all parameters (slower but better)
    - lr = 1e-4
    - epochs = 17
'''



# preprocessing according to MobileNetV2 recomendations
preprocess_train = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.RandAugment(3),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])

preprocess_test = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])


# import data 
data_dir = "dataset_cancer"
sets = ['Train', 'Test']

train_dataset = torchvision.datasets.ImageFolder(root='dataset_cancer/Train', transform=preprocess_train)

# ImageFolder
test_dataset =  torchvision.datasets.ImageFolder(root='dataset_cancer/Test', transform=preprocess_test)

train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=24, shuffle=True, num_workers=8)

# DataLoader
test_loader = torch.utils.data.DataLoader(test_dataset, batch_size=24, shuffle=True, num_workers=8)

# sanity check
class_names = train_dataset.classes
print(class_names)

class ShuffleNetModel(pl.LightningModule):
    def __init__(self, input_shape, num_classes, learning_rate=3e-4, transfer=False):
        super().__init__()

        # log hyperparameters
        self.save_hyperparameters()
        self.learning_rate = learning_rate
        self.dim = input_shape
        self.num_classes = num_classes

        # transfer learning if pretrained=True
        self.feature_extractor = models.shufflenet_v2_x0_5(
            weights=models.ShuffleNet_V2_X0_5_Weights.IMAGENET1K_V1)
        
        # get output from last layer
        in_features = self.feature_extractor.fc.in_features
        
        # remove the last layer (classifier)
        self.feature_extractor.fc = torch.nn.Identity()

        if transfer:
            # layers are frozen by using eval()
            self.feature_extractor.eval()
                
            # freeze params
            for param in self.feature_extractor.parameters():
                param.requires_grad = False

        self.classifier = nn.Linear(in_features, num_classes)

        self.criterion = nn.CrossEntropyLoss()
        self.accuracy = Accuracy()

    def forward(self, x):
        out = self.feature_extractor(x)
        return self.classifier(out)

    def training_step(self, batch):
            batch, labels = batch[0], batch[1]
            # prediction
            out = self.forward(batch)

            # loss and accuracy
            loss = self.criterion(out, labels)
            acc = self.accuracy(out, labels)

            self.log("shuffle/train/loss", loss)        
            self.log("shuffle/train/acc", acc)

            return loss

    def test_step(self, batch, batch_idx):
        batch, labels = batch[0], batch[1]
        out = self.forward(batch)

        loss = self.criterion(out, labels)      
        acc = self.accuracy(out, labels)

        self.log("shuffle/test/loss", loss)        
        self.log("shuffle/test/acc", acc)
        

        return {"loss": loss, "outputs": out, "labels": labels}

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters(), lr=self.learning_rate)


class MobileNetModel(pl.LightningModule):
    def __init__(self, input_shape, num_classes, learning_rate=3e-4, transfer=False):
        super().__init__()

        # log hyperparameters
        self.save_hyperparameters()
        self.learning_rate = learning_rate
        self.dim = input_shape
        self.num_classes = num_classes

        # transfer learning if pretrained=True
        self.feature_extractor = models.mobilenet_v2(
            weights=models.MobileNet_V2_Weights.IMAGENET1K_V1)
        # remove the last layer (classifier)
        self.feature_extractor.classifier = torch.nn.Identity()

        if transfer:
            # layers are frozen by using eval()
            self.feature_extractor.eval()
            
            # freeze params
            for param in self.feature_extractor.parameters():
                param.requires_grad = False

        # get the output size of last layer            
        n_sizes = self._get_conv_output(input_shape)

        # add last layer with correct output
        self.classifier = nn.Linear(n_sizes, num_classes)

        # loss and accuracy functions
        self.criterion = nn.CrossEntropyLoss()
        self.accuracy = Accuracy()
    
    # returns the size of the output tensor going into the Linear layer from the conv block.
    def _get_conv_output(self, shape):
        batch_size = 1
        tmp_input = torch.autograd.Variable(torch.rand(batch_size, *shape))

        output_feat = self.feature_extractor(tmp_input)
        n_size = output_feat.view(batch_size, -1).size(1)

        return n_size
    
    # will be used during inference
    def forward(self, x):
        x = self.feature_extractor(x) # rede pre treinada
        x = x.view(x.size(0), -1) # 
        x = self.classifier(x) # classificador

        return x

    def training_step(self, batch):
        batch, labels = batch[0], batch[1]
        # prediction
        out = self.forward(batch)

        # loss and accuracy
        loss = self.criterion(out, labels)
        acc = self.accuracy(out, labels)

        # logs will be displayed in Tensorboard
        self.log("mobile/train/loss", loss)        
        self.log("mobile/train/acc", acc)

        return loss

    def test_step(self, batch, batch_idx):
        batch, labels = batch[0], batch[1]
        out = self.forward(batch)

        loss = self.criterion(out, labels)      

        acc = self.accuracy(out, labels)
        self.log("mobile/test/loss", loss)        
        self.log("mobile/test/acc", acc)

        return {"loss": loss, "outputs": out, "labels": labels}

    # Would be nice to add validation steps for model evaluation

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters(), lr=self.learning_rate)


# Instanciando os modelos
shuffle_model = ShuffleNetModel((3,256, 256), 9, transfer=False)
mobile_model = MobileNetModel((3,256, 256), 9, transfer=False)

# Instanciando os Trainers
trainer_mobile = pl.Trainer(max_epochs=20)
trainer_shuffle = pl.Trainer(max_epochs=20)

# Treinando, testando  e salvando os modelos 
trainer_mobile.fit(mobile_model, train_loader)
trainer_mobile.test(mobile_model, test_loader)

torch.save(mobile_model.state_dict(), "mobile_model_state.pt")

trainer_shuffle.fit(shuffle_model, train_loader)
trainer_shuffle.test(shuffle_model, test_loader)

torch.save(shuffle_model.state_dict(), "shuffle_model_state.pt")


# trace the model
example_input = torch.rand(1,3,256,256)
traced_mobile_model = torch.jit.trace(mobile_model, example_input)

mobile_model_converted = ct.convert(
    traced_mobile_model, 
    inputs=[ct.TensorType(shape=example_input.shape)], )
mobile_model_converted.save("mobile_model.mlmodel")
