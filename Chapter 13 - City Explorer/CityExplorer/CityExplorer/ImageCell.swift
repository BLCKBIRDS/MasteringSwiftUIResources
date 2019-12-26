//File: ImageCell.swift
//Project: ProjectPhotoMapTutorial

//Created at 20.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import Foundation
import SwiftUI

struct ImageCell: Identifiable {
    let id = UUID()
    let image: Image
}

let samplePhotos = [
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto")),
    ImageCell(image: Image("samplePhoto"))
]
