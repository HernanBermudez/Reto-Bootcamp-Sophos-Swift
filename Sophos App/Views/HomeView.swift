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
                        Image(systemName: "doc.text.fill")
                        Text("Ver Documentos")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[1]) {
                            Text("Ingresar")
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
                        Image(systemName: "doc.text.fill")
                        Text("Oficinas")
                    }
                    Button {
                        
                    } label: {
                        NavigationLink(value: navOptions[2]) {
                            Text("Ingresar")
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
                            .frame(width: 320.0, height: 130.0, alignment: .bottomTrailing)
                        )
                    .foregroundColor(Color.green)
                    .bold()
                
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


struct MenuView: View {
    @Binding var oneActive: Bool
    @Binding var twoActive: Bool
    
    var body: some View {
        Menu {
            Button {
                oneActive = true
            } label: {
                Text("Option One")
            }
        
            Button {
                twoActive = true
            } label: {
                Text("Option Two")
            }
    
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}

struct ContentView: View {
    @State private var oneActive: Bool = false
    @State private var twoActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Option One View"), isActive: $oneActive) { EmptyView() }
                NavigationLink(destination: Text("Option Two View"), isActive: $twoActive) { EmptyView() }
                ScrollView {
                    ForEach(0..<100, id: \.self) { index in
                        Text("\(index)")
                    }
                }
            }
            .navigationTitle("TItle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    MenuView(oneActive: $oneActive, twoActive: $twoActive)
                }
            }
        }
    }
}
