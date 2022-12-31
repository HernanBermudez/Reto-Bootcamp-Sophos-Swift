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
    @Published var complete : Bool = false
    @Published var inProgress: Bool = false
}
