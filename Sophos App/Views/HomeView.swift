//
//  Menutest.swift
//  Sophos App
//
//  Created by 1801C724748LM on 23/12/2022.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var loginVM : LoginViewModel

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
                        Text("Ingresar")
                            .padding(20)
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
                        Text("Ingresar")
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
                
                Spacer()

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
