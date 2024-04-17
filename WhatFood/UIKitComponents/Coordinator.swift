//
//  Coordinator.swift
//  WhatFood
//
//  Created by Kush Sharma on 16/04/2024.
//

import UIKit

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let parent: ImagePicker
    
    init(_ imagePicker: ImagePicker) {
        self.parent = imagePicker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        parent.uiImage = info[.originalImage] as? UIImage
        parent.isPresenting = false

    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isPresenting = false
    }
    
}
