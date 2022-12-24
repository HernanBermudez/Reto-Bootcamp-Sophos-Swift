//
//  Menutest.swift
//  Sophos App
//
//  Created by 1801C724748LM on 23/12/2022.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var loginVM : ViewModel
    let menuOptions = ["Home", "Send", "See", "Offices", "Logout"]

    var body: some View {
        NavigationSplitView{
            Text("Contenido")
        } detail: {
            
        }
        .toolbar(content: {
            Menu{
                NavigationLink("Menú Principal", value: menuOptions[0])
                NavigationLink("Enviar Documento", value: menuOptions[1])
                NavigationLink("Ver Documento", value: menuOptions[2])
                NavigationLink("Ver Oficinas", value: menuOptions[3])
                NavigationLink("Logout", value: menuOptions[4])
            } label: {
                Image(systemName: "list.bullet")
                    .foregroundColor(colorSophos)
            }
            .navigationDestination(for: String.self) { value in
                ForEach(menuOptions, id:\.self) {option in
                    OfficesView()
                }
            }
        })
        .navigationBarBackButtonHidden(true)
        .navigationTitle(loginVM.user.nombre).navigationBarTitleDisplayMode(.automatic)
        .environmentObject(loginVM)
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ViewModel())
    }
}
