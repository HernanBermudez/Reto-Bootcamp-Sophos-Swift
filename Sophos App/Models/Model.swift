//
//  Credentials.swift
//  Sophos App
//
//  Created by 1801C724748LM on 07/12/2022.
//

import Foundation

struct UserModel : Decodable {
    var id : String = ""
    var nombre : String = ""
    var apellido : String = ""
    var acceso : Bool = false
    var admin : Bool = false
}

struct OfficesItems : Decodable {
    var Items: [Offices]
}

struct Offices : Decodable {
    var ciudad : String = ""
    var longitud : String = ""
    var idOficina : Int = 0
    var latitud : String = ""
    var nombre : String = ""
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
