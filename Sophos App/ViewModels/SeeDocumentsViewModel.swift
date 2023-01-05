//
//  SeeDocumentsViewModel.swift
//  Sophos App
//
//  Created by 1801C724748LM on 04/01/2023.
//

import Foundation
import SwiftUI

class SeeDocumentsViewModel : ObservableObject {
    @Published var selectedDocument : String = ""
    @Published var fetchedDocuments = FetchDocumentsModel(Items: [FetchDocumentsItem()])
    @Published var fetchedDocumentDetails = FetchDocumentDetailModel(Items: [FetchDocumentDetailItem()])
    @Published var documentList : SeeDocumentsList = SeeDocumentsList()
    @Published var formatterDate = DateFormatter()
    @Published var decodedImage : UIImage = UIImage(systemName: "doc")!
    @Published var images : Array<UIImage> = [UIImage()]
    
    func decodeImage(base64 : String?) -> UIImage{
        let rebornImg = (base64?.imageFromBase64)!
        return rebornImg
        
    }
    
    func dateFormatter(date : String) -> String {
        var dateSplitted = date
        let ix = dateSplitted.startIndex // the index of 1st character
        let ix2 = dateSplitted.index(ix, offsetBy: 10) // the index of 10th character
        let ix3 = dateSplitted.index(ix, offsetBy: dateSplitted.count - 1) // the index of last character

        dateSplitted.removeSubrange(ix2...ix3)
        let dateFormatted = dateSplitted.split(separator: "-")
        let finalDate = String(dateFormatted[2] + "-" + dateFormatted[1] + "-" + dateFormatted[0])
        return finalDate
    }

    func fetchDocuments(email : String) async {
        guard let url = URL(string: documentsUrl + "?correo=" + email.lowercased()) else {
            print("Invalid URL")
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try! JSONDecoder().decode(FetchDocumentsModel?.self, from: data){
                fetchedDocuments = decodedResponse
                documentList.documents = decodedResponse.Items
            }
            for (index, documents) in documentList.documents.enumerated() {
                //datesArray.dates.append(dateFormatter(date: dates.Fecha))
                documentList.documents[index].Fecha = dateFormatter(date: documents.Fecha)
            }
        } catch {
            print("Failed retrieving documents")
        }
        //jsonString = String(data: encodedDocument, encoding: .utf8)!
        //print(jsonString)
    }
    
    func fetchImageDocument (registro : String) async {
        guard let url = URL(string: documentsUrl + "?idRegistro=" + registro) else {
            print("Invalid URL")
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try! JSONDecoder().decode(FetchDocumentDetailModel?.self, from: data){
                fetchedDocumentDetails = decodedResponse
            }
            for documents in fetchedDocumentDetails.Items {
                images.append(decodeImage(base64: documents.Adjunto))
            }
        } catch {
            print("Failed retrieving documents")
        }
    }
}
