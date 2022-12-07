//
//  OvalTextFieldStyle.swift
//  Sophos App
//
//  Created by 1801C724748LM on 05/12/2022.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 0.451, green: 0.302, blue: 0.953)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
