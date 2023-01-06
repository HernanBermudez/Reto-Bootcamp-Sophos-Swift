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
            Image(uiImage: seeDocumentsVM.images[0]).frame(width: 300, height: 600, alignment: .center)
                .padding(20)
            Image(uiImage: seeDocumentsVM.images[1])
            Image(systemName: "person.circle.fill")
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(.black)
        }.environmentObject(seeDocumentsVM)
    }
}
