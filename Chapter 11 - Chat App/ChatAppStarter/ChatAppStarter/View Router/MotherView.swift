//
//  MotherView.swift
//  NavigateInSwiftUIComplete
//
//  Created by Andreas Schultz on 19.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
            VStack {
                if viewRouter.currentPage == "loginScreen" {
                    LoginScreen()
                } else if viewRouter.currentPage == "chatScreen" {
                    ChatScreen()
                }
            }
    }
}

#if DEBUG
struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter(pageToStartWith: "loginScreen"))
    }
}
#endif
