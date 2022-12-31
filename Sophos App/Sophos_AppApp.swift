//
//  Sophos_AppApp.swift
//  Sophos App
//
//  Created by 1801C724748LM on 01/12/2022.
//

import SwiftUI

@main
struct Sophos_AppApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .onAppear{
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
