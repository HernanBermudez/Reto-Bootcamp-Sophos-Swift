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
    @State var complete: Bool = false
    @State var inProgress: Bool = false
    let imageSelection = ["Cargar Foto", "Tomar Foto"]
    var idFormPicker : IdFormPicker = IdFormPicker()

    init(){
        self.idFormPicker.idTypes = ["Cédula de Ciudadanía", "Tarjeta de Identidad", "Pasaporte", "Cédula de Extranjería"]
    }
    
    var body: some View {
        NavigationSplitView {
            Spacer()
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
                if let image = sendDocumentsVM.imageView {
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
                    ForEach(idFormPicker.idTypes, id: \.self){ id in
                        Text(id).tag(id as String)
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
            }
            AsyncButtonOriginal(isComplete: complete, action: {
                sendDocumentsVM.encodeImage(imageFunc: sendDocumentsVM.imageView)
                sendDocumentsVM.postNewDocument(datosNuevoDocumento: sendDocumentsVM.datosNuevoDocumento)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {complete = true}
                }
            })
            {
                Text(complete || inProgress ? "" : "Submit")
            }
            
            Spacer()

        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Envío de Documentación")
        .sheet(isPresented: $sendDocumentsVM.showPicker) {
            ImagePicker(sourceType: sendDocumentsVM.source == .library ? .photoLibrary : .camera, selectedImage: $sendDocumentsVM.imageView )
                .ignoresSafeArea()
        }
        .alert("Error", isPresented: $sendDocumentsVM.showCameraAlert, presenting: sendDocumentsVM.cameraError, actions: { cameraError in
            cameraError.button
        }, message: { cameraError in
            Text(cameraError.message)
        })
    }
}
