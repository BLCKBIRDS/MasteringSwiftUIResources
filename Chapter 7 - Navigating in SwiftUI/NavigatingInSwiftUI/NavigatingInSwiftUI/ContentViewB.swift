//
//  ContentViewB.swift
//  NavigateInSwiftUITutorial
//
//  Created by Andreas Schultz on 18.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ContentViewB : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            HappyDog()
            Button(action: {self.viewRouter.currentPage = "page1"}) {
                BackButtonContent()
            }
        }
    }
}

#if DEBUG
struct ContentViewB_Previews : PreviewProvider {
    static var previews: some View {
        ContentViewB().environmentObject(ViewRouter())
    }
}
#endif

struct HappyDog : View {
    var body: some View {
        return Image("happyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}

struct BackButtonContent : View {
    var body: some View {
        return Text("Back")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}
