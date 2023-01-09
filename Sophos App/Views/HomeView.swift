//
//  Menutest.swift
//  Sophos App
//
//  Created by 1801C724748LM on 23/12/2022.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var loginVM : LoginViewModel
    let navOptions = ["Send", "See", "Offices"]

    var body: some View {
        NavigationSplitView{
            VStack{
                /*
                HStack{
                    Text(loginVM.user.nombre)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 220.0))
                        .font(.system(size: 26))
                        .fontWidth(.standard)
                        .foregroundColor(colorSophos)
                    NavMenu()
                }
                 */
                ZStack(alignment: .topLeading){
                    Image("background")
                        .resizable()
                        .frame(width: 400.0, height: 240.0)
                        
                    Text(loginVM.languageSelector ? "Welcome" : "Bienvenido")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(EdgeInsets(top: 30.0, leading: 20.0, bottom: 0, trailing: 0))
                    Text(loginVM.languageSelector ? "This are the options \nthat we have for you " : "Estas son las opciones \nque tenemos para ti")
                        .lineLimit(2)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 150.0, leading: 20.0, bottom: 0, trailing: 0))
                }
                
                _VSpacer()
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text(loginVM.languageSelector ? "Send Documents" : "Enviar Documentos")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[0]) {
                            Text(loginVM.languageSelector ? "Go" : "Ingresar")
                                .padding(20)
                        }
                    }
                    .frame(width: 110.0, height: 50.0, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.pink, lineWidth: 4)
                    )
                    .padding(EdgeInsets(top: 0, leading: 150, bottom: 0, trailing: 0))

                }.overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.pink, lineWidth: 4)
                                .frame(width: 320.0, height: 130.0, alignment: .trailing)
                    )
                    .foregroundColor(Color.pink)
                    .bold()
                
                Spacer()
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.magnifyingglass")
                        Text(loginVM.languageSelector ? "See Documents" : "Ver Documentos")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[1]) {
                            Text(loginVM.languageSelector ? "Go" : "Ingresar")
                                .padding(20)
                        }
                    }.frame(width: 110.0, height: 50.0, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.indigo, lineWidth: 4)
                        )
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 0, trailing: 0))

                }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.indigo, lineWidth: 4)
                            .frame(width: 320.0, height: 130.0, alignment: .trailing)
                        )
                    .foregroundColor(Color.indigo)
                    .bold()

                Spacer()
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "mappin.circle.fill")
                        Text(loginVM.languageSelector ? "Offices" : "Oficinas")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[2]) {
                            Text(loginVM.languageSelector ? "Go" : "Ingresar")
                                .padding(20)
                        }
                    }.frame(width: 110.0, height: 50.0, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.green, lineWidth: 4)
                        )
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 0, trailing: 0))

                }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.green, lineWidth: 4)
                            .frame(width: 320.0, height: 130.0, alignment: .trailing)
                        )
                    .foregroundColor(Color.green)
                    .bold()
                
                Spacer()

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
            }
        } detail: {
            
        }
        .toolbar(content: {
            Text(loginVM.user.nombre)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 220.0))
                .font(.system(size: 26))
                .fontWidth(.standard)
                .foregroundColor(colorSophos)
            NavMenu()
        })
        .navigationBarBackButtonHidden(true)
        .environmentObject(loginVM)
    }
}
