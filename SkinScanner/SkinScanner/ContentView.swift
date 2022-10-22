//
//  ContentView.swift
//  SkinScanner
//
//  Created by vivi on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                HomeView(coreDM: CoreDataManager())
            }
            .fullScreenCover(isPresented: $showOnboarding, content: {
                OnboardingView(showOnboarding: $showOnboarding)
            })
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
