//
//  PhotoPicker.swift
//  SkinScanner
//
//  Created by vivi on 22/10/22.
//

import Foundation
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable{
    
    @Binding var classicationImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage{
                guard let data = image.jpegData(compressionQuality: 0.5), let compressedImage = UIImage(data: data) else {
                    print("An error occuured while compressing the selected image")
                    return
                }
                photoPicker.classicationImage = compressedImage
            } else {
                print("Deu ruim no Picker Controller")
            }
            picker.dismiss(animated: true)
        }
    }
    
}
