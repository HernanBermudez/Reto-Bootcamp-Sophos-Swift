//
//  Menutest.swift
//  Sophos App
//
//  Created by 1801C724748LM on 23/12/2022.
//

import SwiftUI

enum MenuOptions: String, Hashable, CaseIterable {
    case menuPrincipal = "Menú Principal"
    case enviarDocumento = "Enviar Documento"
    case verDocumentos = "Ver Documentos"
    case oficinas = "Oficinas"
    case cerrarSesión = "Cerrar Sesión"
}

struct MenuOption: Hashable {
    let view: String
    let option: MenuOptions
}

struct HomeView: View {

    @State private var selectedOption: MenuOptions?
    @State private var backButton = "Regresar"
    @State private var navState = NavigationPath()
    @EnvironmentObject var loginVM : ViewModel
    
    let menuOptions = [MenuOption(view: "HomeView", option: .menuPrincipal), MenuOption(view: "SendDocumentsView", option: .enviarDocumento), MenuOption(view: "SeeDocumentsView", option: .verDocumentos), MenuOption(view: "OfficesView", option: .oficinas), MenuOption(view: "LogoutView", option: .cerrarSesión)]
    let columns: [GridItem] = [.init(.fixed(400)), .init(.fixed(400))]
    
    var body: some View {
        NavigationSplitView {
            List(MenuOptions.allCases, id: \.self, selection: $selectedOption) { option in
                NavigationLink(option.rawValue, value: option)
            }.navigationTitle(backButton)
        } detail: {
            OfficesView()
        }.navigationBarBackButtonHidden(true)
            .navigationTitle(loginVM.user.nombre)
            .navigationBarTitleDisplayMode(.large).navigationSplitViewStyle(.automatic)
            .navigationDestination(for: String.self, destination: { view in
                if view == "HomeView" {
                    HomeView()
                } else if view == "SendDocumentsView" {
                    SendDocumentsView()
                } else if view == "SeeDocumentsView" {
                    SeeDocumentsView()
                } else if view == "OfficesView" {
                    OfficesView()
                }
            })
    }
}
