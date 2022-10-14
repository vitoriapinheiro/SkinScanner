//
//  ContentView.swift
//  SkinScanner
//
//  Created by vivi on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    let model = MobileNetV2()
    
    private func performImageClassification(){
        guard let img = UIImage(named: "cat"),
        let ri = img.resizeTo(size: CGSize(width: 224, height: 224)),
        let b = ri.toBuffer() else {
            return
        }
        
        let output = try? model.prediction(image: b)
        
        var res = ""
        if let output = output {
            res = output.classLabel
        }
        
        print(res)
    }
    
    var body: some View {
        NavigationView {
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
