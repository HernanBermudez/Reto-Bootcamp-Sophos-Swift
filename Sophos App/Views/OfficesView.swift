//
//  OfficesView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI

struct OfficesView: View {
    @EnvironmentObject var loginVM : ViewModel
    var body: some View {
        NavigationSplitView {
            VStack{
                Text("Hello, this are our offices, \(loginVM.user.nombre)")
            }
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Oficinas")
    }
}
