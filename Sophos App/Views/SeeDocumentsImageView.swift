//
//  SeeDocumentsImageView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 05/01/2023.
//

import SwiftUI

struct SeeDocumentsImageView: View {
    @EnvironmentObject var seeDocumentsVM : SeeDocumentsViewModel
    @EnvironmentObject var loginVM : LoginViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            PhotoDetailView(image: seeDocumentsVM.images)
            Button{
                dismiss()
            } label: {
                Text(loginVM.languageSelector ? "Dismiss" : "Volver")
            }
            .font(.title)
            .padding(20)
            .background(colorSophos)
            .foregroundColor(loginVM.languageSelector ? Color.black : Color.white)
            .cornerRadius(20)
        }
    }
}
