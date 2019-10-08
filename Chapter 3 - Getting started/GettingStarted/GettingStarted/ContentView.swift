//
//  ContentView.swift
//  GettingStarted
//
//  Created by Andreas Schultz on 29.09.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("My first SwiftUI app")
                .font(.largeTitle)
                .foregroundColor(.purple)
            HStack {
                Text("That's awesome")
                Spacer()
                Text("Yeah!")
            }
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
