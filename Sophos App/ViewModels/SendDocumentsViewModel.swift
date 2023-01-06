//
//  SendDocumentsViewModel.swift
//  Sophos App
//
//  Created by 1801C724748LM on 29/12/2022.
//

import Foundation
import UIKit

class SendDocumentsViewModel: ObservableObject {
    @Published var datosNuevoDocumento = SendDocumentModel()
    @Published var jsonString : String = ""
    @Published var objectFromApi : SendDocumentModel = SendDocumentModel()
    @Published var imageView : UIImage?
    @Published var imageBase64 : String? = ""
    @Published var encodedImage : String = ""
    @Published var decodedImage : UIImage = UIImage()
    @Published var showPicker = false
    @Published var selectionImage : String = "Cargar Foto"
    @Published var source : PhotoPicker.Source = .library
    @Published var showCameraAlert : Bool = false
    @Published var cameraError : PhotoPicker.CameraErrorType?
    @Published var complete : Bool = false
    @Published var inProgress: Bool = false
    @Published var idFormPicker : IdFormPicker = IdFormPicker()

    func showPhotoPicker() {
        do {
            if source == .camera {
                try PhotoPicker.checkPermissions()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = PhotoPicker.CameraErrorType(error: error as! PhotoPicker.PhotoPickerError)
        }
    }
    
    func encodeImage(imageFunc: UIImage?){
        imageBase64 = imageFunc?.base64
        datosNuevoDocumento.Adjunto = imageBase64 ?? "No se subio la imagen codificada"
        print(datosNuevoDocumento.Adjunto)
    }
    
    func postNewDocument(datosNuevoDocumento : SendDocumentModel) {
        guard let url = URL(string: documentsUrl) else {
            print("Invalid URL")
            return
        }
        do {
            let encodedDocument = try! JSONEncoder().encode(self.datosNuevoDocumento)
            var request = URLRequest(
                url: url,
                cachePolicy: .reloadIgnoringLocalCacheData
            )
            request.httpMethod = "POST"
            request.httpBody = encodedDocument
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                print(response!)
            }
            task.resume()
        }
        //jsonString = String(data: encodedDocument, encoding: .utf8)!
        //print(jsonString)
    }
    
    func getDocuments () {
        if let dataFromApi = jsonString.data(using: .utf8) {
            objectFromApi = try! JSONDecoder().decode(SendDocumentModel.self, from: dataFromApi)
            print(objectFromApi)
        }
    }
}
