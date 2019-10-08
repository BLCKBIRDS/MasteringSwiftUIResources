//
//  ChatMessage.swift
//  ChatAppFinished
//
//  Created by Andreas Schultz on 05.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import Foundation


class ChatMessage {
    
    var messageText: String
    var username: String
    var isMe: Bool
    var messageId = UUID()

    init(messageText: String, username: String) {
        self.messageText = messageText
        self.username = username
        
        if UserDefaults.standard.string(forKey: "username") == username {
            self.isMe = true
        } else {
            self.isMe = false
        }
    }
}



