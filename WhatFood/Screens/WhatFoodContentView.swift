//
//  WhatFoodContentView.swift
//  WhatFood
//
//  Created by Kush Sharma on 16/04/2024.
//

import SwiftUI

struct WhatFoodContentView: View {
    
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier = ClassifierViewModel()
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "photo.badge.plus.fill")
                    .onTapGesture {
                        isPresenting = true
                    }
                Image(systemName: "camera.badge.ellipsis.fill")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera
                    }
            }
            .font(.largeTitle)
            .foregroundColor(.teal)
            
            Rectangle()
                .strokeBorder()
                .foregroundColor(.green)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                )
            
            VStack{
                Button(action: {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }) {
                    Image(systemName: "gear.badge.questionmark")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.cyan)
                        .symbolRenderingMode(.multicolor)
                }
                
                Group {
                    if let imageClass = classifier.imageClass {
                        HStack{
                            Text("Image categories:")
                                .font(.title)
                            Text(imageClass)
                                .bold()
                        }
                    } else {
                        HStack{
                            Text("Image categories: Not Found")
                                .font(.caption)
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
        .padding()
    }
}

#Preview {
    WhatFoodContentView()
}
