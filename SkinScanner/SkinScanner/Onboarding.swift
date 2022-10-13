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
                imageName: "leaf",
                title: "Ipslum Lorem",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra turpis sem, ac dignissim sem faucibus elementum. Nam tincidunt bibendum luctus. Donec non gravida lorem.",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
                .background(Color.cyan)
            PageView(
                imageName: "bell",
                title: "Ipslum Lorem",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra turpis sem, ac dignissim sem faucibus elementum. Nam tincidunt bibendum luctus. Donec non gravida lorem.",
                showDismissButton: false,
                showOnboarding: $showOnboarding
            )
                .background(Color.red)
            PageView(
                imageName: "camera",
                title: "Ipslum Lorem",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra turpis sem, ac dignissim sem faucibus elementum. Nam tincidunt bibendum luctus. Donec non gravida lorem.",
                showDismissButton: true,
                showOnboarding: $showOnboarding
            )
                .background(Color.blue)
        }
        .tabViewStyle(PageTabViewStyle())
    }
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
                Button(action: {
                    showOnboarding.toggle()
                }, label: {
                    Text("Iniciar")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(8)
                })
                .padding()
            }
        }
    }
}
