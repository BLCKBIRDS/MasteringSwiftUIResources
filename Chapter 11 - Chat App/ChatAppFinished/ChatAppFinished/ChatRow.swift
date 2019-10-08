//
//  ChatRow.swift
//  ChatAppFinished
//
//  Created by Andreas Schultz on 05.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ChatRow: View {
    
    var message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isMe {
                Spacer()
            }
            VStack(alignment: .leading) {
                Text(message.username)
                    .font(.footnote)
                    .foregroundColor(message.isMe ? lightGreyColor : .gray)
                Text(self.message.messageText)
                    .font(.body)
                    .foregroundColor(message.isMe ? .white : .black)
                    .lineLimit(nil)
            }
                .padding(10)
                .background(self.message.isMe ? Color.blue : lightGreyColor)
                .cornerRadius (10)
                .frame(maxWidth: 280, alignment: message.isMe ? .trailing : .leading)
            if !message.isMe {
                Spacer()
            }
        }
        .padding()
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: ChatMessage(messageText: "Hello", username: "Not me"))
    }
}
