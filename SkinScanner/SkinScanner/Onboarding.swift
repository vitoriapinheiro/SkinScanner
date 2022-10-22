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
                imageName: "bandage",
                title: "Encontrou algo estranho na sua pele?",
                description: "Estamos aqui para lhe ajudar a descobrir o que pode ser.",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
            PageView(
                imageName: "heart.text.square",
                title: "Desenvolvemos um modelo que pode lhe alertar sobre uma possível doença",
                description: "Basta tirar uma foto da área que você encontrou algo estranho",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
            PageView(
                imageName: "cross.case",
                title: "Não deixe de consultar um médico(a)",
                description: "Idependente do resultado, não deixe de consultar um especilista da área para entender melhor o seu caso. Nosso modelo ainda está em etapas iniciais de teste.",
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
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
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
