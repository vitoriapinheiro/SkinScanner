import coremltools
import coremltools.proto.FeatureTypes_pb2 as ft 

spec = coremltools.utils.load_spec("mobile_model.mlmodel")

input = spec.description.input[0]
input.type.imageType.colorSpace = ft.ImageFeatureType.RGB
input.type.imageType.height = 256 # image needs to be 256x256
input.type.imageType.width = 256

coremltools.utils.save_spec(spec, "new_mobile_model.mlmodel")