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
    let imageSelection = ["Cargar Foto", "Tomar Foto"]
    @State var selection : String = "Cédula de Ciudadanía"
    
    init() {
        self._selection = State(initialValue: idTypes.first ?? "")
    }
    var body: some View {
        NavigationSplitView {
            Menu {
                Button {
                    sendDocumentsVM.source = .library
                    sendDocumentsVM.showPhotoPicker()
                } label: {
                    Text("Cargar foto")
                }
                Button {
                    sendDocumentsVM.source = .camera
                    sendDocumentsVM.showPhotoPicker()
                } label: {
                    Text("Tomar foto")
                }
            } label: {
                if let image = sendDocumentsVM.image {
                    Image(uiImage: image)
                        .resizable()
                        .cornerRadius(25)
                        .frame(maxWidth: 150, maxHeight: 120)
                        .padding(.horizontal)
                } else {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .resizable()
                        .opacity(0.6)
                        .frame(maxWidth: 150, maxHeight: 120)
                        .padding(.horizontal)
                }
            }
            Form {
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
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Envío de Documentación")
        .environmentObject(officesVM)
        .environmentObject(sendDocumentsVM)
        .sheet(isPresented: $sendDocumentsVM.showPicker) {
            ImagePicker(sourceType: sendDocumentsVM.source == .library ? .photoLibrary : .camera, selectedImage: $sendDocumentsVM.image )
                .ignoresSafeArea()
        }
        .alert("Error", isPresented: $sendDocumentsVM.showCameraAlert, presenting: sendDocumentsVM.cameraError, actions: { cameraError in
            cameraError.button
        }, message: { cameraError in
            Text(cameraError.message)
        })
    }
}

//struct SendDocumentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SendDocumentsView()
//    }
//}
