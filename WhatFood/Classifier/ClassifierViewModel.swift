//
//  ClassifierViewModel.swift
//  WhatFood
//
//  Created by Kush Sharma on 16/04/2024.
//

import SwiftUI

class ClassifierViewModel: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
        
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
        
    }
        
}
