//
//  RoundedRectangleInput.swift
//  Sophos App
//
//  Created by 1801C724748LM on 05/12/2022.
//

import SwiftUI

struct RoundedRectangleInput: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 0)
            .foregroundColor(Color.black).background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 0.451, green: 0.302, blue: 0.953)]), startPoint: .topLeading, endPoint: .bottomTrailing)).cornerRadius(20)
            .shadow(color: .gray, radius: 10)

    }
}
