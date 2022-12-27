//
//  NavMenu.swift
//  Sophos App
//
//  Created by 1801C724748LM on 27/12/2022.
//

import SwiftUI

struct NavMenu: View {
    let menuOptions = ["Home", "Send", "See", "Offices", "Logout"]
    var body: some View {
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
                if option == "Home" {
                    HomeView()
                }
                if option == "Send" {
                    SendDocumentsView()
                }
                if option == "See" {
                    SeeDocumentsView()
                }
                if option == "Offices" {
                    OfficesView()
                }
                if option == "Logout" {
                    LogoutView()
                }
            }
        }    }
}

