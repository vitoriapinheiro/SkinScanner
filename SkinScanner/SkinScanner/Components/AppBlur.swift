//
//  AppBlur.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation
import SwiftUI

struct BlurView : UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
