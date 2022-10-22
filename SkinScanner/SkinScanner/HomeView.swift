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
    
    @State private var isShowingPhotoPicker = false
    @State private var classificationImage = UIImage(named: "melanoma")!
    
    var body: some View{
        VStack{
            Image(uiImage: classificationImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .frame(width: 300, height: 300)
                .clipShape(Rectangle())
                .padding()
            AppButton(
                title: "Tirar foto",
                action: {},
                enable: true,
                isFill: true,
                iconName: "camera"
            )
            AppButton(
                title: "Importar da galeria",
                action: {isShowingPhotoPicker = true},
                enable: true,
                isFill: true,
                iconName: "photo.on.rectangle.angled"
            )
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
