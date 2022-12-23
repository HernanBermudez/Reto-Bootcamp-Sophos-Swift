//
//  LoginViewModel.swift
//  Sophos App
//
//  Created by 1801C724748LM on 19/12/2022.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var user = [UserModel]()
    func fetch(email: String, password: String) {
        
        guard let url = URL(string: apiUrl + "?idUsuario" + email + "&clave" + password ) else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            
            // convert to json
            do {
                let user = try JSONDecoder().decode([UserModel].self, from: data)
                DispatchQueue.main.async {
                    self?.user = user
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
