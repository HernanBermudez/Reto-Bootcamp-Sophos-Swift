//
//  Authentication.swift
//  Sophos App
//
//  Created by 1801C724748LM on 20/12/2022.
//

import Foundation
import SwiftUI

class Authentication: ObservableObject {
    @AppStorage("AUTH_KEY") var authenticated = false{
        willSet { objectWillChange.send()}
    }
    @AppStorage("USER_KEY") var username = ""
    @Published var password = ""
    @Published var invalid: Bool = false
    
    private var sampleUser = "username"
    
}


