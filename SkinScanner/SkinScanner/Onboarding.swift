//
//  Onboarding.swift
//  SkinScanner
//
//  Created by vivi on 12/10/22.
//

import Foundation
import SwiftUI


struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    
    var body: some View {
        TabView {
            PageView(
                imageName: "itch",
                title: "Encontrou algo estranho na sua pele?",
                description: "Estamos aqui para te ajudar! Desenvolvemos um modelo que pode te alertar sobre uma possível doença.",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
            PageView(
                imageName: "skin-allergy",
                title: "Basta tirar uma foto da sua pele",
                description: "Garanta que a foto tenha uma boa iluminação e capture bem a área de interesse",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
            PageView(
                imageName: "shield",
                title: "Fique tranquilo! Não armazenamos os seus dados",
                description: "As imagens que precisamos para dar o resultado só podem ser acessadas no seu dispositivo.",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
            PageView(
                imageName: "irritation",
                title: "Não deixe de consultar um médico(a)",
                description: "Independentemente do resultado, não deixe de consultar um especialista da área para entender melhor o seu caso. Nosso modelo não substitui um exame clínico.",
                showDismissButton: true,
                showOnboarding: $showOnboarding
            )
            
        }
        .tabViewStyle(PageTabViewStyle())    }
}

struct PageView: View {
    let imageName: String
    let title: String
    let description: String
    let showDismissButton: Bool
    @Binding var showOnboarding: Bool
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding()
            
            Text(title)
                .font(.system(size: 32))
                .padding()
            
            Text(description)
                .foregroundColor(Color(.secondaryLabel))
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .padding()
            
            if showDismissButton {
                AppButton(
                    title: "Vamos lá!",
                    action: {showOnboarding.toggle()},
                    enable: true,
                    isFill: true,
                    iconName: ""
                )
                .padding()
            }
        }
    }
}
