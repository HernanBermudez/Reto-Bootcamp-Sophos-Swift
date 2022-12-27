//
//  LogoutView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 23/12/2022.
//

import SwiftUI

struct LogoutView: View {
    var body: some View {
        NavigationSplitView {
            Text("Hello, let's logout!")
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Regresar")
    }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView()
    }
}
