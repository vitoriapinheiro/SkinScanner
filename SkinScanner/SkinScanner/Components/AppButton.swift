//
//  AppButton.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation
import SwiftUI

struct AppButton: View {
    let title: String
    let action: () -> Void
    let enable: Bool
    let isFill: Bool
    let iconName: String
    
    var body: some View {
        Button(action: {
            if enable {
                action()
            }
        }, label: {
            HStack{
                if(iconName != "") {
                    Image(systemName: iconName)
                }
                Text(title)
                }
                .bold()
                .foregroundColor(isFill ? Color.white : Color.orange)
                .frame(width: 300, height: 48)
                .background(isFill ? (enable ? Color.orange: Color.gray) : Color.white.opacity(0))
                .cornerRadius(16)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
            }
        )
    }
}
