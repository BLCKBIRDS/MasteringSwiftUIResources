//
//  KeyboardResponder.swift
//  ChatAppFinished
//
//  Created by Andreas Schultz on 06.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import Foundation
import SwiftUI

class KeyboardResponder: ObservableObject {
    
    var _center: NotificationCenter
    
    @Published var currentHeight: CGFloat = 0 

    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
