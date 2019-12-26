//File: DownloadManager.swift
//Project: ProjectPhotoMapTutorial

//Created at 22.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import Foundation
import SwiftUI
import Alamofire
import AlamofireImage

class DownloadManager: ObservableObject {
    
    @Published var imagesFetched = false
    @Published var percentLoaded = 0.0
    
    var imageURLs = [String]()
    var imageCells = [ImageCell]()
    
    func startDownload(flickrURL: String) {
        print("Started fetching images from Flickr.")
        
        retrieveImageURLS(fromFlickrURL: flickrURL) { (finished) in
            if finished {
                print("All image URLs retrieved.")
                self.retrieveImages { (finished) in
                    if finished {
                        print("Images succesfully downloaded")
                        self.imagesFetched = true
                    }
                }
            }
        }
    }
    
    func retrieveImageURLS(fromFlickrURL: String, handler: @escaping (_ status: Bool) -> ()) {
        Alamofire.request(fromFlickrURL).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String, AnyObject> else {
                print("Json could not be created.")
                return
            }
            let motherPhotosDict = json["photos"] as! Dictionary<String, AnyObject>
            let photoDicts = motherPhotosDict["photo"] as! [Dictionary<String, AnyObject>]
            for photo in photoDicts {
                let photoURL = "https://farm\(photo["farm"]!).staticflickr.com/\(photo["server"]!)/\(photo["id"]!)_\(photo["secret"]!)_b.jpg"
                self.imageURLs.append(photoURL)
            }
            handler(true)
        }
    }
    
    func retrieveImages(handler: @escaping(_ status: Bool) -> ()) {
        guard !imageURLs.isEmpty else { return handler(true) }
        
        for url in imageURLs {
            Alamofire.request(url).responseImage { (response) in
                guard let image = response.result.value else {
                    print("Image could not be fetched from \(url).")
                    return
                }
                self.imageCells.append(ImageCell(image: Image(uiImage: image)))
                withAnimation() {
                    self.percentLoaded = Double(self.imageCells.count)/Double(self.imageURLs.count)
                }
                print("\(self.imageCells.count)/\(self.imageURLs.count) images downloaded.")
                if self.imageCells.count == self.imageURLs.count {
                    handler(true)
                }
            }
        }
    }
    
    func clean() {
        imageURLs.removeAll()
        imageCells.removeAll()
        percentLoaded = 0.0
    }
}
