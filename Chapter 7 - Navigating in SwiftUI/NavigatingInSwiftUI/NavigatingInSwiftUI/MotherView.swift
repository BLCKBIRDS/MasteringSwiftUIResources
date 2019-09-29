//
//  MotherView.swift
//  NavigateInSwiftUIComplete
//
//  Created by Andreas Schultz on 19.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct MotherView : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1" {
                ContentViewA()
            } else if viewRouter.currentPage == "page2" {
                ContentViewB()
                    .transition(.scale)
            }
        }
    }
}

#if DEBUG
struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
#endif
