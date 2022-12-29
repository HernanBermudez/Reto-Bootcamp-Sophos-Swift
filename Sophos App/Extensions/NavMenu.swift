//
//  NavMenu.swift
//  Sophos App
//
//  Created by 1801C724748LM on 27/12/2022.
//

import SwiftUI

struct NavMenu: View {
    @EnvironmentObject var loginVM : LoginViewModel
    let menuOptions = ["Home", "Send", "See", "Offices", "Logout"]
    var body: some View {
        Menu{
            NavigationLink("Menú Principal", value: menuOptions[0])
            NavigationLink("Enviar Documento", value: menuOptions[1])
            NavigationLink("Ver Documento", value: menuOptions[2])
            NavigationLink("Ver Oficinas", value: menuOptions[3])
            NavigationLink("Logout", value: menuOptions[4]).onTapGesture {
                loginVM.isLoggedIn.toggle()
                loginVM.isPresented.toggle()
                loginVM.loggingIn.append(false)
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
            if value == "Logout" {
                LoginView()
            }
        }.environmentObject(loginVM)
    }
}

