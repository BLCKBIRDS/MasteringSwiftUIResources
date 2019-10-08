//
//  ContentView.swift
//  RollTheDice!
//
//  Created by Andreas Schultz on 29.09.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var rolledNumber = 1
    
    @State var rolledIt = false
    
    var body: some View {
        VStack {
            Image(rolledIt ? "\(rolledNumber)" : "unknown")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .padding(.top, 250)
            Spacer()
            Button(action: {
                let randomNumber = Int.random(in: 1 ..< 7)
                self.rolledNumber = randomNumber
                self.rolledIt = true
            }) {
                RollButtonContent()
            }
                .padding(.bottom, 40)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RollButtonContent: View {
    var body: some View {
        Text("Roll the dice")
            .frame(width: 240, height: 75)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.orange)
            .cornerRadius(20)
    }
}
