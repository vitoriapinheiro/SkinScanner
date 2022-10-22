//
//  HomeView.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation
import SwiftUI
import UIKit

struct HomeView: View {
    let coreDM: CoreDataManager
    let photo = "melanoma"
    
    @State private var isShowingPhotoPicker = false
    @State var classificationImage = UIImage(named: "melanoma")!
    
    @State private var classificationLabel: String = ""
    
    @State private var userCaseResult: String = ""
    
//    let model = mobile_model()
    let model = MobileNetV2()
    
    private func performImageClassification(){
        guard let image = UIImage(named: photo),
              let resizedImage = classificationImage.resizeTo(size: CGSize(width: 224, height: 224)), // Change size when update model
              let buffer = resizedImage.toBuffer() else {
            return
        }

        let output = try? model.prediction(image: buffer)
        
        if let output = output {
            self.classificationLabel = output.classLabel
        }
        
    }
    
    var body: some View{
        ScrollView(.vertical) {
            ZStack{
                VStack{
                    Image(uiImage: classificationImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .frame(width: 300, height: 300)
                        .clipShape(Rectangle())
                        .padding()
                    Text(classificationLabel)
                        .bold()
                    TextField("Digite o resultado", text: $userCaseResult)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    AppButton(
                        title: "Salvar",
                        action: {
                            coreDM.saveCase(result: userCaseResult)
                        },
                        enable: true,
                        isFill: true,
                        iconName: "square.and.arrow.down"
                    )
                    AppButton(
                        title: "Classificar",
                        action: {
                            self.performImageClassification()
                        },
                        enable: true,
                        isFill: true,
                        iconName: "scanner"
                    )
                    AppButton(
                        title: "Escolher imagem",
                        action: {isShowingPhotoPicker = true},
                        enable: true,
                        isFill: true,
                        iconName: "photo.on.rectangle.angled"
                    )
                }
            }
        }
        .navigationTitle("Skin Scanner")
        .toolbar{
            NavigationLink(destination: ResultView(), label: {
                Image(systemName: "clock.arrow.circlepath")
                    .bold()
                    .foregroundColor(Color.orange)
            })
        }
        .sheet(
            isPresented: $isShowingPhotoPicker,
            content: {PhotoPicker(classicationImage: $classificationImage)}
        )
    }
}
