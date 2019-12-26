//File: APIHelper.swift
//Project: ProjectPhotoMapTutorial

//Created at 22.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import Foundation

//let apiKey = *insert your apiKey as a String"

func generateFlickrURL(latitude: Double, longitude: Double, numberOfPhotos: Int) -> String {
    let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&lat=\(latitude)&lon=\(longitude)&radius=1&radius_units=km&per_page=\(numberOfPhotos)&format=json&nojsoncallback=1"
    return url
}
