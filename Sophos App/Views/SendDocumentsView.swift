//
//  SendDocumentsView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI

struct SendDocumentsView: View {
    @ObservedObject var sendDocumentsVM  = SendDocumentsViewModel()
    @EnvironmentObject var loginVM : LoginViewModel
    @EnvironmentObject var officesVM : OfficesViewModel
    let idTypes = ["Cédula de Ciudadanía", "Tarjeta de Identidad", "Pasaporte", "Cédula de Extranjería"]
    @State private var selection : String = "Cédula de Ciudadanía"
    @State var someText: String = "hOLA"
    var body: some View {
        NavigationSplitView {
            Text("Hello, ready to send your docs?")
            
            Form {
                TextField("Acá va la imagen", text: $sendDocumentsVM.datosNuevoDocumento.Adjunto)
                Picker("Tipo de Identificación", selection: $sendDocumentsVM.datosNuevoDocumento.TipoId){
                    ForEach(idTypes, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.menu)
                TextField("Número de Documento", text: $sendDocumentsVM.datosNuevoDocumento.Identificacion)
                TextField("Nombres", text: $sendDocumentsVM.datosNuevoDocumento.Nombre)
                TextField("Apellidos", text: $sendDocumentsVM.datosNuevoDocumento.Apellido)
                TextField(loginVM.email, text: $sendDocumentsVM.datosNuevoDocumento.Correo)
                Picker("Ciudad", selection: $sendDocumentsVM.datosNuevoDocumento.Ciudad){
                    ForEach(officesVM.officesCities, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.menu)
                Button {
                    
                } label: {
                    Text("Documento")
                }
                AsyncButton(isComplete: sendDocumentsVM.complete) {
                    sendDocumentsVM.inProgress.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            sendDocumentsVM.complete = true
                        }
                    }
                } label: {
                    Text(sendDocumentsVM.complete || sendDocumentsVM.inProgress ? "" : "Enviar")
                }


            }

            HStack{
                Image(systemName: "person.circle.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                TextField("Email", text: $someText)
            }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))//.offset(y:-60)
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Envío de Documentación")
        .environmentObject(officesVM)
    }
}

//struct SendDocumentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SendDocumentsView()
//    }
//}
