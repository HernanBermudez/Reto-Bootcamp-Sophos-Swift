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
    @Published var image : UIImage?
    @Published var showPicker = false
    @Published var selectionImage : String = "Cargar Foto"
    @Published var source : PhotoPicker.Source = .library
    @Published var showCameraAlert : Bool = false
    @Published var cameraError : PhotoPicker.CameraErrorType?
    @Published var complete : Bool = false
    @Published var inProgress: Bool = false
    
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
}
