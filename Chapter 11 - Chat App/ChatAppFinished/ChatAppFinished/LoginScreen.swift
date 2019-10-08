//
//  LoginScreen.swift
//  ChatAppStarter
//
//  Created by Andreas Schultz on 05.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginScreen: View {
    
    @State var usernameInput = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .padding(.top, 100)
                .padding(.bottom, 170)
            Text("Please choose a username")
            TextField("Enter username...", text: $usernameInput)
                .padding()
                .frame(height: 50)
                .background(lightGreyColor)
                .cornerRadius(10)
                .padding()
            Spacer()
            Button(action: {self.signIn()}) {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            Spacer()
        }
    }
    
    func signIn() {
        
        guard !usernameInput.isEmpty else {
            return
        }
        
        let defaults = UserDefaults.standard
        defaults.set(usernameInput, forKey: "username")
        
        viewRouter.currentPage = "chatScreen"

    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
