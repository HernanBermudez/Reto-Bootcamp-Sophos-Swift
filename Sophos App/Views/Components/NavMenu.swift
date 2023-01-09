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
    let menuOptions = ["Send", "See", "Offices", "Idioma Inglés"]
    var body: some View {
        Menu{
            NavigationLink(loginVM.languageSelector ? "Send Document" : "Enviar Documento", value: menuOptions[0])
            NavigationLink(loginVM.languageSelector ? "See Document" : "Ver Documento", value: menuOptions[1])
            NavigationLink(loginVM.languageSelector ? "See Offices" : "Ver Oficinas", value: menuOptions[2])
            Button {
                loginVM.languageSelector.toggle()
            } label: {
                Text(loginVM.languageSelector ? "Spanish Language" : menuOptions[3])
            }

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
            switch value{
            case "Send":
                SendDocumentsView()
            case "See":
                SeeDocumentsView()
            case "Offices":
                OfficesView()
            default:
                HomeView()
            }
        }.environmentObject(loginVM)
    }
}

