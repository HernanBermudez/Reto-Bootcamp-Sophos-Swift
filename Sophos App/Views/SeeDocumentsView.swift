//
//  SeeDocumentsView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI

struct SeeDocumentsView: View {
    @ObservedObject var seeDocumentsVM = SeeDocumentsViewModel()
    @EnvironmentObject var loginVM : LoginViewModel
 
    var body: some View {
        NavigationSplitView {
            Text("Hello, check out your docs!")
            Spacer()
            List {
                ForEach(seeDocumentsVM.documentList.documents, id: \.self){ doc in
                    GroupBox{
                        Text(doc.Nombre + doc.Apellido)
                        Text(doc.TipoAdjunto)
                    }
                }
                ForEach(seeDocumentsVM.datesArray.dates, id: \.self){date in
                    Text(date)
                }
            }
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .onAppear{
            Task{
                await seeDocumentsVM.fetchDocuments(email: loginVM.email)
            }
        }
        .environmentObject(loginVM)
        .navigationTitle("Documentos")

        
    }
}

struct SeeDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        SeeDocumentsView()
    }
}
