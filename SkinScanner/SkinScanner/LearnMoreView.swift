//
//  LearnMoreView.swift
//  SkinScanner
//
//  Created by vivi on 24/10/22.
//

import Foundation
import SwiftUI

struct LearnMoreView: View {
    
    var diseases: [Disease] = DiseaseList.diseaseClasses
    
    var body: some View {
        
        List(diseases, id: \.id){ disease in
            NavigationLink(destination: DiseaseDetailView(disease: disease)) {
                HStack{
                    Image(disease.image)
                        .resizable()
                        .scaledToFill()
                        .frame( width: 120, height: 90)
                        .cornerRadius(8)
                        .padding(.vertical, 4)
                    VStack(alignment: .leading, spacing: 4){
                        Text(disease.result)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        Text(disease.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(4)
                            .minimumScaleFactor(0.3)
                    }
                }
            }
        }
        .navigationBarTitle("Saber mais", displayMode: .large)
        .foregroundColor(Color.orange)
    }
}

