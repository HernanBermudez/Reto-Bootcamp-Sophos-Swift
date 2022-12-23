//
//  HomeView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 02/12/2022.
//

import SwiftUI

struct HomeViewOld: View {
    @EnvironmentObject var loginVM : ViewModel
    var body: some View {
        NavigationSplitView{
            VStack{
                Text("Hola \(loginVM.user.nombre)")
                Text("Usuario : \(loginVM.user.apellido)")
            }.navigationTitle(loginVM.user.nombre)
                .navigationBarTitleDisplayMode(.large)
        } detail: {
            MenuView()
            
        }.navigationBarBackButtonHidden(true).toolbar {
            Text("akhj")
            Text("akhj23")
            Text("alolol")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
