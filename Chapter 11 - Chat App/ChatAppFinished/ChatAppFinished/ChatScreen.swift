//
//  ChatScreen.swift
//  ChatAppStarter
//
//  Created by Andreas Schultz on 05.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ChatScreen: View {
    
    @State var newMessageInput = ""
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    @ObservedObject var chatController: ChatController
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(chatController.messages, id: \.messageId) { message in
                    ChatRow(message: message)
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lightGreyColor, lineWidth: 2)
                        .padding()
                    HStack {
                        TextField("New message...", text: $newMessageInput, onCommit: {
                            guard !self.newMessageInput.isEmpty else {
                                print("Message is empty")
                                return
                            }
                            self.chatController.sendMessage(messageText: self.newMessageInput)
                            self.newMessageInput = ""
                        })
                            .padding(30)
                        Button(action: {
                            guard !self.newMessageInput.isEmpty else {
                                print("Message is empty")
                                return
                            }
                            self.chatController.sendMessage(messageText: self.newMessageInput)
                            self.newMessageInput = ""
                        }) {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                                .padding(30)
                        }
                    }
                }
                    .frame(height: 70)
                    .offset(y: -keyboardResponder.currentHeight)
            }
                .navigationBarTitle("Chat App")
                .onAppear(perform: {self.chatController.receiveMessages()})
        }
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen(chatController: ChatController())
    }
}
