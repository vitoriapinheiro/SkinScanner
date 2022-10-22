//
//  SelectImageView.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation
import SwiftUI

struct SelectImageView: View {
        
    private func performImageClassification(){
//        guard let img = UIImage(named: "cat"),
//              let ri = img.resizeTo(size: CGSize(width: 224, height: 224)),
//              let b = ri.toBuffer() else {
//            return
//        }
//
//        let output = try? model.prediction(image: b)
        
        var res = ""
//        if let output = output {
//            res = output.classLabel
//        }
        
        print(res)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(){
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Home Page")
                    Button {
                        self.performImageClassification()
                    } label: {
                        Text("Iniciar")
                    }
                    
                }
                .padding()
                .navigationTitle("Home")
            }
        }
    }
    
}
