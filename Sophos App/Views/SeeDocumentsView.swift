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
            List {
                ForEach(seeDocumentsVM.documentList.documents, id: \.self){ doc in
                    Button{
                        Task{
                            await seeDocumentsVM.fetchImageDocument(registro: doc.IdRegistro)
                        }
                        showingSheet.toggle()
                    } label: {
                        GroupBox{
                            Text(doc.Fecha)
                            Text(doc.TipoAdjunto)
                            Text(doc.Nombre + " " + doc.Apellido)
                        }
                    }
                    .sheet(isPresented: $showingSheet){
                        SeeDocumentsImageView()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -20))
                        .foregroundColor(colorSophos)
                }.multilineTextAlignment(TextAlignment.center)
            }
        } detail: {
            
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
        .toolbar(content: {
            NavMenu()
        })
        .navigationTitle(loginVM.languageSelector ? "Documents" : "Documentos")
    }
}

struct SeeDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        SeeDocumentsView()
    }
}
