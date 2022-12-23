//
//  UIKeyboardBehaviour.swift
//  Sophos App
//
//  Created by 1801C724748LM on 07/12/2022.
//

import UIKit

extension UIApplication{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
