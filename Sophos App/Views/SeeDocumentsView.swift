//
//  SeeDocumentsView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI

struct SeeDocumentsView: View {
    var body: some View {
        NavigationSplitView {
            Text("Hello, check out your docs!")
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Documentos")

        
    }
}

struct SeeDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        SeeDocumentsView()
    }
}
