//ContentView.swift

//Created by BLCKBIRDS on 18.10.19.
//Visit www.BLCKBIRDS.com for more.

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var imageController: ImageController
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Image(uiImage: self.imageController.displayedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height*(3/4))
                        .clipped()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ThumbnailView(width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "Original", filter: .Original)
                            ThumbnailView(width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "Sepia", filter: .Sepia)
                            ThumbnailView(width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "Mono", filter: .Mono)
                            ThumbnailView(width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "Vibrance", filter: .Vibrance)
                            ThumbnailView(width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "Highlight", filter: .Highlight)
                            ThumbnailView(width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "Vignette", filter: .Vignette)
                        }
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height*(1/4))
                }
            }
                .navigationBarTitle("Filter App", displayMode: .inline)
                .navigationBarItems(leading: LeadingNavigationBarItems(), trailing: TrailingNavigationBarItem())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ImageController())
    }
}

struct ThumbnailView: View {
    
    @EnvironmentObject var imageController: ImageController
    
    var width: CGFloat
    var height: CGFloat
    var filterName: String
    var filter: FilterType
    
    var body: some View {
        Button(action: {self.imageController.displayedImage = self.imageController.generateFilteredImage(inputImage: self.imageController.originalImage!, filter: self.filter)}) {
            VStack {
                Text(filterName)
                    .foregroundColor(.black)
                Image(uiImage: imageController.generateFilteredImage(inputImage: imageController.thumbnailImage!, filter: filter))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .cornerRadius(20)
                    .clipped()
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}

struct LeadingNavigationBarItems: View {
    
    @EnvironmentObject var imageController: ImageController
    
    @State var showImagePicker = false
    @State var showCameraView = false
    
    var body: some View {
        HStack {
            Button(action: {self.showImagePicker = true}) {
                Image(systemName: "photo")
                    .foregroundColor(Color(UIColor.black))
                    .imageScale(.large)
            }
                .sheet(isPresented: self.$showImagePicker) {
                    ImagePicker(imageController: self.imageController, showImagePicker: self.$showImagePicker)
                }
            Button(action: {self.showCameraView = true}) {
                Image(systemName: "camera")
                    .foregroundColor(Color(UIColor.black))
                    .imageScale(.large)
            }
                .sheet(isPresented: self.$showCameraView) {
                    CameraView(imageController: self.imageController, showCameraView: self.$showCameraView)
                }
        }
    }
}

struct TrailingNavigationBarItem: View {
    
    @EnvironmentObject var imageController: ImageController
    
    var body: some View {
        Button(action: {self.imageController.saveImage()}) {
            Image(systemName: "square.and.arrow.down")
                .foregroundColor(Color(UIColor.black))
                .imageScale(.large)
        }
    }
}
