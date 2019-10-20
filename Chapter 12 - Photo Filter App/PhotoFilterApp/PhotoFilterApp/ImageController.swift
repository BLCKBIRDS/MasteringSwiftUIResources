//ImageController.swift

//Created by BLCKBIRDS on 18.10.19.
//Visit www.BLCKBIRDS.com for more.

import Foundation
import SwiftUI
import Combine

class ImageController: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ImageController, Never>()
    
    var originalImage = UIImage(named: "testImage") {
        didSet {
            displayedImage = originalImage
            thumbnailImage = originalImage?.compressed()
            objectWillChange.send(self)
        }
    }
    
    var displayedImage = UIImage(named: "testImage") {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var thumbnailImage = UIImage(named: "testImage")?.compressed()
    
    func generateFilteredImage(inputImage: UIImage, filter: FilterType) -> UIImage {
        let context = CIContext(options: nil)
        let unprocessedImage = CIImage(image: inputImage)
        
        switch filter {
        case .Original:
            return originalImage!
        case .Sepia:
            let filter = CIFilter(name: "CISepiaTone")
            filter?.setValue(unprocessedImage, forKey: "inputImage")
            
            if let output = filter?.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Mono:
            let filter = CIFilter(name: "CIPhotoEffectMono")
            filter?.setValue(unprocessedImage, forKey: "inputImage")
            
            if let output = filter?.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Vibrance:
            let filter = CIFilter(name: "CIVibrance")
            filter?.setValue(unprocessedImage, forKey: "inputImage")
            filter?.setValue(20, forKey: "inputAmount")
        
            if let output = filter?.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Highlight:
            let filter = CIFilter(name: "CIHighlightShadowAdjust")
            filter?.setValue(unprocessedImage, forKey: "inputImage")
            filter?.setValue(1.4, forKey: "inputHighlightAmount")
            filter?.setValue(3.0, forKey: "inputShadowAmount")

            if let output = filter?.outputImage {
                if let cgimg =  context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Vignette:
            let filter = CIFilter(name: "CIVignette")
            filter?.setValue(unprocessedImage, forKey: "inputImage")
            filter?.setValue(1.0, forKey: "inputRadius")
            filter?.setValue(3.0, forKey: "inputIntensity")

            if let output = filter?.outputImage {
                if let cgimg =  context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        }
        
        return originalImage!
    }
    
    func saveImage() {
        UIImageWriteToSavedPhotosAlbum(displayedImage!, nil, nil, nil)
    }
    
}
