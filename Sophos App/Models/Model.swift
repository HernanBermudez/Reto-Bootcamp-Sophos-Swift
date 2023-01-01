//
//  Credentials.swift
//  Sophos App
//
//  Created by 1801C724748LM on 07/12/2022.
//

import Foundation
import MapKit
import AVFoundation
import SwiftUI

struct UserModel : Decodable {
    var id : String = ""
    var nombre : String = ""
    var apellido : String = ""
    var acceso : Bool = false
    var admin : Bool = false
}

struct OfficesItems : Decodable {
    var Items: Array<Offices>
    var Count : Int = 0
    var ScannedCount : Int = 0
}

struct Offices : Decodable {
    var Ciudad : String = ""
    var Longitud : String = ""
    var IdOficina : Int = 0
    var Latitud : String = ""
    var Nombre : String = ""
}

struct OfficePin: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct SendDocumentModel: Codable {
    var TipoId : String = ""
    var Identificacion : String = ""
    var Nombre : String = ""
    var Apellido : String = ""
    var Ciudad : String = ""
    var Correo : String = ""
    var TipoAdjunto : String = ""
    var Adjunto : String = ""
}

struct IdFormPicker: Identifiable {
    let id = UUID()
    var idTypes : Array<String> = ["Cédula de Ciudadanía", "Tarjeta de Identidad", "Pasaporte", "Cédula de Extranjería"]
}

struct CitiesFormPicker: Identifiable {
    let id = UUID()
    var cities : Array<String> = []
}

enum PhotoPicker {
    enum Source: String {
        case library, camera
    }
    enum PhotoPickerError : Error, LocalizedError {
        case unavailable
        case restricted
        case denied
        
        var errorDescription: String? {
            switch self {
            case .unavailable:
                return NSLocalizedString("There is no camera available on this device", comment: "")
            case .restricted:
                return NSLocalizedString("You are not allowed to access media capture devices", comment: "")
            case.denied:
                return NSLocalizedString("You have explicitly denied permission for media capture. Please open permissions/Privacy/Camera and grant access for this application", comment: "")
            }
        }
    }
    static func checkPermissions()throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case.denied:
                throw PhotoPickerError.denied
            case.restricted:
                throw PhotoPickerError.restricted
            default:
                break
            }
        } else {
            throw PhotoPickerError.unavailable
        }
    }
    
    struct CameraErrorType {
        let error : PhotoPicker.PhotoPickerError
        var message : String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel){}
    }
}
