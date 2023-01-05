//
//  Menutest.swift
//  Sophos App
//
//  Created by 1801C724748LM on 23/12/2022.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var loginVM : LoginViewModel
    let navOptions = [0, 1, 2]

    var body: some View {
        NavigationSplitView{
            VStack{
                ZStack(alignment: .topLeading){
                    Image("background")
                        .resizable()
                        .frame(width: 400.0, height: 240.0)
                        
                    Text("Bienvenido")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(EdgeInsets(top: 30.0, leading: 20.0, bottom: 0, trailing: 0))
                    Text("Estas son las opciones \nque tenemos para ti")
                        .lineLimit(2)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 150.0, leading: 20.0, bottom: 0, trailing: 0))
                }
                
                _VSpacer()
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text("Enviar Documentos")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[0]) {
                            Text("Ingresar")
                                .padding(20)
                        }
                    }
                    .frame(width: 100.0, height: 50.0, alignment: .trailing)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.pink, lineWidth: 4)
                    )

                }.padding(20.0)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.pink, lineWidth: 4)
                                .frame(width: 320.0, height: 150.0, alignment: .center)
                    )
                
                Spacer()
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text("Ver Documentos")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[1]) {
                            Text("Ingresar")
                                .padding(20)
                        }
                    }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.indigo, lineWidth: 4)
                    )

                }.padding(20.0)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.indigo, lineWidth: 4)
                        )
                    .frame(width: .infinity)

                Spacer()
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text("Oficinas")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[2]) {
                            Text("Ingresar")
                                .padding(20)
                        }
                    }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.green, lineWidth: 4)
                    )

                }.padding(20.0)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.green, lineWidth: 4)
                        )
                    .frame(width: .infinity)
                
                Spacer()

            }
            .navigationDestination(for: Int.self, destination: { option in
                switch option{
                case 0:
                    SendDocumentsView()
                case 1:
                    SeeDocumentsView()
                case 2:
                    OfficesView()
                default:
                    HomeView()
                }
            })
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
