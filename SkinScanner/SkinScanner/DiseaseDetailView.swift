//
//  DiseaseDetailView.swift
//  SkinScanner
//
//  Created by vivi on 24/10/22.
//

import Foundation
import SwiftUI

struct DiseaseDetailView: View {
    var disease: Disease
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 16) {
                Image(disease.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .padding(.vertical)
                Spacer(minLength: 16)
                Text(disease.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(16)
                Spacer()
                Link(destination: disease.url) {
                    Text("Ir para o site")
                        .bold()
                        .font(.title2)
                        .frame(width: 260, height: 50)
                        .background(Color(.orange))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .navigationBarTitle("\(disease.result)", displayMode: .large)
    }
}
