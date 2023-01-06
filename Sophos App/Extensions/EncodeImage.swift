//
//  EncodeImage.swift
//  Sophos App
//
//  Created by 1801C724748LM on 30/12/2022.
//

import Foundation
import UIKit

extension UIImage {
    var base64: String? {
        let imageData = self.jpegData(compressionQuality: 1)?.base64EncodedString(options: .lineLength64Characters)
        return imageData
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

//let img = //get UIImage from wherever
//let base64 = img.base64
//let rebornImg = base64?.imageFromBase64
