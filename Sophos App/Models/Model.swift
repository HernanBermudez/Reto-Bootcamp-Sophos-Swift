//
//  Credentials.swift
//  Sophos App
//
//  Created by 1801C724748LM on 07/12/2022.
//

import Foundation
import MapKit

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

enum PhotoPicker {
    enum Source: String {
        case library, camera
    }
}
