//
//  SeeDocumentsImageView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 05/01/2023.
//

import SwiftUI

struct SeeDocumentsImageView: View {
    @EnvironmentObject var seeDocumentsVM : SeeDocumentsViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            PhotoDetailView(image: seeDocumentsVM.images)
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(.black)
        }
    }
}
