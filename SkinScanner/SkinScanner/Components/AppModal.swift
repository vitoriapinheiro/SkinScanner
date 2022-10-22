//
//  AppModal.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation
import SwiftUI

struct AppModal: View {
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25){
                Image("leaf")
                Text("Parabéns, bb!")
                    .font(.title)
                    .foregroundColor(.pink)
                Text("Você ganhou moreee!")
                Button(action: {}){
                    Text("Voltar")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.purple)
                        .clipShape(Capsule())
                }
                
            }
            .padding()
            Button(action: {
                withAnimation {
                    show.toggle()
                }
            }){
                Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.purple)
            }
            
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 30)
        .background(BlurView())
        .cornerRadius(25)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan.opacity(0.35)
            .onTapGesture {
                withAnimation{
                    show.toggle()
                    
                }
            })
    }
}
