//
//  ContentView.swift
//  SkinScanner
//
//  Created by vivi on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Home Page")
            }
            .padding()
            .navigationTitle("Home")
        }
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView(showOnboarding: $showOnboarding)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
