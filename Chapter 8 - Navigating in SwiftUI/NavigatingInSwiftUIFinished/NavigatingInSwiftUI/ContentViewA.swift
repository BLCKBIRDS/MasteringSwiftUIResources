//
//  ContentViewA.swift
//  NavigateInSwiftUITutorial
//
//  Created by Andreas Schultz on 18.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ContentViewA : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            GrumpyDog()
            Button(action: {
                withAnimation() {
                    self.viewRouter.currentPage = "page2"
                }
            }) {
                NextButtonContent()
            }
        }
    }
}

#if DEBUG
struct ContentViewA_Previews : PreviewProvider {
    static var previews: some View {
        ContentViewA().environmentObject(ViewRouter())
    }
}
#endif












struct NextButtonContent : View {
    var body: some View {
        return Text("Next")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

struct GrumpyDog : View {
    var body: some View {
        return Image("grumpyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}
