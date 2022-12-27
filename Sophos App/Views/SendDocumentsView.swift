//
//  SendDocumentsView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI

struct SendDocumentsView: View {
    var body: some View {
        NavigationSplitView {
            Text("Hello, ready to send your docs?")
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Regresar")
    }
}

struct SendDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocumentsView()
    }
}
