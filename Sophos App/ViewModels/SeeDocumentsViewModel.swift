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
    @Published var registers : Array<String> = [""]
    @Published var registerId : String = ""
    
    func decodeImage(base64 : String?){
        let rebornImg = base64?.imageFromBase64
        images.append(rebornImg ?? UIImage(systemName: "doc")!)
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data(base64Encoded: imageBase64String)
        let image = UIImage(data: imageData!)
        return image!
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
                documentList.documents[index].Fecha = dateFormatter(date: documents.Fecha)
                registers.append(documents.IdRegistro)
            }
            print(registers)
            registerId = registers[2]
        } catch {
            print("Failed retrieving documents")
        }
        //guard let registroUrl = URL(string: documentsUrl + "?idRegistro=" + )
        //jsonString = String(data: encodedDocument, encoding: .utf8)!
        //print(jsonString)
    }
    
    func fetchImageDocument (registro : String) async {
        guard let url = URL(string: documentsUrl + "?idRegistro=" + registro) else {
            print("Invalid URL")
            return
        }
        print(url)
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try JSONDecoder().decode(FetchDocumentDetailModel?.self, from: data){
                fetchedDocumentDetails = decodedResponse
            }
            for documents in fetchedDocumentDetails.Items {
                if documents.Adjunto.count > 0 {
                    //images.append(convertBase64StringToImage(imageBase64String: documents.Adjunto))
                    decodeImage(base64: documents.Adjunto)
                    print(documents.Adjunto)
                }
                print(images)
            }
        } catch {
            print("Failed retrieving documents")
        }
    }
}
