//
//  HistoryView.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            ForEach(0 ..< 100){ i in
                AppButton(
                    title: "Tirar foto",
                    action: {print("Tirando foto")},
                    enable: true,
                    isFill: true,
                    iconName: "camera"
                )
            }
        }
        .navigationBarTitle("Histórico", displayMode: .large)
        .foregroundColor(Color.orange)
        
    }
}
