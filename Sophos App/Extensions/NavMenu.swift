//
//  NavMenu.swift
//  Sophos App
//
//  Created by 1801C724748LM on 27/12/2022.
//

import SwiftUI

struct NavMenu: View {
    @EnvironmentObject var loginVM : LoginViewModel
    @EnvironmentObject var officesVM : OfficesViewModel
    let menuOptions = ["Home", "Send", "See", "Offices"]
    var body: some View {
        Menu{
            NavigationLink("Menú Principal", value: menuOptions[0])
            NavigationLink("Enviar Documento", value: menuOptions[1])
            NavigationLink("Ver Documento", value: menuOptions[2])
            NavigationLink("Ver Oficinas", value: menuOptions[3])
            Button {
                Task {
                    await loginVM.signOut()
                    await officesVM.resetOffices()
                }
            } label: {
                Text("Logout")
            }
        } label: {
            Image(systemName: "list.bullet")
                .foregroundColor(colorSophos)
        }
        .navigationDestination(for: String.self) { value in
            
            if value == "Home" {
                HomeView()
            }
            if value == "Send" {
                SendDocumentsView()
            }
            if value == "See" {
                SeeDocumentsView()
            }
            if value == "Offices" {
                OfficesView()
            }
        }.environmentObject(loginVM)
    }
}

