//
//  ResultView.swift
//  SkinScanner
//
//  Created by vivi on 22/10/22.
//

import Foundation
import SwiftUI

struct ResultView: View {
    let photo = "melanoma"
    @State private var classificationLabel: String = ""
    
//    let model = mobile_model()
    let model = MobileNetV2()
    
    private func performImageClassification(){
        guard let image = UIImage(named: photo),
              let resizedImage = image.resizeTo(size: CGSize(width: 224, height: 224)), // Change size when update model
              let buffer = resizedImage.toBuffer() else {
            return
        }

        let output = try? model.prediction(image: buffer)
        
        if let output = output {
            self.classificationLabel = output.classLabel
        }
        
    }
    
    var body: some View{
        VStack{
            Image(photo)
            Text(classificationLabel)
                .bold()
            AppButton(
                title: "Classificar",
                action: {
                    self.performImageClassification()
                },
                enable: true,
                isFill: true,
                iconName: "scanner"
            )
        }
    }

}
