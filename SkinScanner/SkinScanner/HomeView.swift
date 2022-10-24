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
    let photo = "melanoma"
    let diseaseResult: [String] = ["Ceratose actínica", "Carcinoma basocelular", "Dermatofibroma", "Melanoma", "Mancha", "Ceratose Seborreica", "Carcinoma de células escamosas", "Lesões Vascular"]
    
    @State private var isShowingPhotoPicker = false
    @State var classificationImage = UIImage(named: "melanoma")!
    
    @State private var classificationLabel: String = ""
    
    //    let model = mobile_model()
//    let model = MobileNetV2()
        let model = new_mobile_model()
    //    let model = TestW20()
    
//    func mapDisease(input: [Float32]) -> Int {
//        let a = input.max()
//        let res = input.firstIndex(where: {$0 == a})
//
//
//                let count = 0..<9
//                var res = 0
//                for i in count {
//                    if (a == input[i]){
//                        res = i
//                    }
//                }
//        return res ?? 0
//    }
    
    func performImageClassification(){
        guard let _ = UIImage(named: photo),
              let resizedImage = classificationImage.resizeTo(size: CGSize(width: 256, height: 256)), // Change size when update model
              let buffer = resizedImage.toBuffer() else {
            return
        }
        
        
        let output = try? model.prediction(x_1: buffer)
        
        let result = output?.var_930
        if let b = try? UnsafeBufferPointer<Float>(result!) {
            let c = Array(b)
            let highscore = c.max()
            let fullresult = c.index(of: highscore!)
            let campeao = c[fullresult!]
            print("\n Resultado: \(fullresult)")
            self.classificationLabel = diseaseResult[fullresult!]
            
        }
        
//        if let b = try? UnsafeBufferPointer<Float>(aux!) {
//            let c = Array(b)
//            print(c.max())
//            print(b)
//
//        }
        
        
//        let aux = output?.var_930.max()
        //        let res = output.firstIndex(where: {$0 == aux})
        
        if let output = output {
//                    print("Output \(output?.classLabel)")
                    print("Output \(output.var_930)")
            //        if(output?.var_930 != nil){
            //            let b = mapDisease(input: output?.var_930)
//            self.classificationLabel = output.classLabel
        }
        //        print("\nIndice do resultado: \(b)")
    }
    
    //    }
    
    var body: some View{
        ZStack{
            VStack{
                if(classificationImage == UIImage(named: "melanoma")){
                    Text("Selecione uma imagem")
                        .font(.title2)
                        .bold()
                } else {
                    Image(uiImage: classificationImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .cornerRadius(16)
                        .clipShape(Rectangle())
                        .padding()
                    Text("Resultado: \(classificationLabel)")
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
                AppButton(
                    title: "Escolher imagem",
                    action: {isShowingPhotoPicker = true},
                    enable: true,
                    isFill: true,
                    iconName: "photo.on.rectangle.angled"
                )
            }
        }
        .navigationTitle("Skin Scanner")
        .toolbar{
            NavigationLink(destination: LearnMoreView()) {
                Label(title: {
                    Text("Saber mais")
                }) {
                    Image(systemName: "lightbulb")
                        .bold()
                        .foregroundColor(Color.orange)
                }
            }
        }
        .sheet(
            isPresented: $isShowingPhotoPicker,
            content: {PhotoPicker(classicationImage: $classificationImage)}
        )
    }
}
