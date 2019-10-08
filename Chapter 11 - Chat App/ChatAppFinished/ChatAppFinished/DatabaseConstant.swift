//
//  DatabaseConstant.swift
//  ChatAppFinished
//
//  Created by Andreas Schultz on 07.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import Foundation
import Firebase

let databaseRoot = Database.database().reference()
let databaseChats = databaseRoot.child("chats")
