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
            VStack{
                ZStack(alignment: .topLeading){
                    Image("background")
                        .resizable()
                        .frame(width: .infinity, height: 240.0)
                        
                    Text("Bienvenido")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(EdgeInsets(top: 30.0, leading: 20.0, bottom: 0, trailing: 0))
                    Text("Estas son las opciones \nque tenemos para ti")
                        .lineLimit(2)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 150.0, leading: 20.0, bottom: 0, trailing: 0))
                }
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text("Enviar Documentos")
                    }
                    Button {
                        
                    } label: {
                        Text("Ingresar")
                    }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.red, lineWidth: 4)
                    )

                }.padding(20.0)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 4)
                        )
                    .frame(width: .infinity)
                
                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text("Ver Documentos")
                    }
                    Button {
                        
                    } label: {
                        Text("Ingresar")
                    }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.purple, lineWidth: 4)
                    )

                }.padding(20.0)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.purple, lineWidth: 4)
                        )
                    .frame(width: .infinity)

                VStack(spacing: 20.0){
                    HStack{
                        Image(systemName: "doc.text.fill")
                        Text("Oficinas")
                    }
                    Button {
                        
                    } label: {
                        Text("Ingresar")
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

            }
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
        .navigationTitle(loginVM.user.nombre).navigationBarTitleDisplayMode(.inline)
        .environmentObject(loginVM)
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ViewModel())
    }
}
