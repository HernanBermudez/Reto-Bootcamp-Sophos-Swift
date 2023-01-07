//
//  SeeDocumentsView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI

struct SeeDocumentsView: View {
    @EnvironmentObject var seeDocumentsVM : SeeDocumentsViewModel
    @EnvironmentObject var loginVM : LoginViewModel
    @State private var showingSheet = false
 
    var body: some View {
        NavigationSplitView {
            Text("Hello, check out your docs!")
            Spacer()
            List {
                ForEach(seeDocumentsVM.documentList.documents, id: \.self){ doc in
                    Button {
                        showingSheet.toggle()
                        Task {
                            await seeDocumentsVM.fetchImageDocument(registro: doc.IdRegistro)
                        }
                    } label: {
                        GroupBox{
                            Text(doc.Fecha + " - " + doc.TipoAdjunto)
                            Text(doc.Nombre + " " + doc.Apellido)
                        }
                    }
                    .sheet(isPresented: $showingSheet){
                        SeeDocumentsImageView()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -20))
                        .foregroundColor(colorSophos)
                }
            }
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Documentos")
    }
}

struct SeeDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        SeeDocumentsView()
    }
}
