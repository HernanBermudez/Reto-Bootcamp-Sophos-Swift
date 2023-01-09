//
//  ViewModel.swift
//  Sophos App
//
//  Created by 1801C724748LM on 20/12/2022.
//

import Foundation
import SwiftUI
import LocalAuthentication

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email: String = UserDefaults.standard.string(forKey: "emailUser") ?? ""
    @Published var password: String = "0S9Hh6WA3m4i"
    @Published var loginErrors: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var inProgress: Bool = false
    @Published var loggingIn = NavigationPath()
    @Published var user = UserModel()
    @Published var isPresented: Bool = false
    @Published var complete: Bool = false
    @Published var languageSelector : Bool = false
    @Published var isUnlocked : Bool = false
    
    func validView(email: String, password: String) -> String? {
      
        if self.email.isEmpty {
                return "Email está vacío"
        }
        
        if !self.isValidEmail(email) {
                return "Email inválido"
        }
            
        if self.password.isEmpty {
                return "Contraseña vacía"
        }
            
        if self.password.count < 8 {
                return "Contraseña mínimo de 8 caracteres"
        }
            return nil
        }
        
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func signOut() async {
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
            loggingIn = NavigationPath()
            isLoggedIn.toggle()
            isPresented.toggle()
            inProgress.toggle()
            complete.toggle()
        }catch{
            print("Ocurrió un error al intentar cerrar sesión")
        }
    }
    
    func logIn (email: String, password: String) async {
        
        print("Iniciando sesion")
        let userLoggingIn : String = "idUsuario=" + email.lowercased() + "&clave=" + password
        
        guard let url = URL(string: logInUrl + userLoggingIn) else {
            print("Invalid URL")
            return
        }
        print(url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            inProgress = true
            if let decodedResponse = try JSONDecoder().decode(UserModel?.self, from: data){
                user = decodedResponse
                print(user.nombre)
                isLoggedIn = user.acceso
                isPresented = true
                UserDefaults.standard.set(email, forKey: "emailUser")
                loggingIn.append(true)
            }
        } catch {
            inProgress.toggle()
            loginErrors = "Usuario o contraseña incorrectos"
            print("Invalid data")
        }
    }
    
    func authenticate(email: String, password: String) async {
        let context = LAContext()
        var error: NSError?
        
        print("Iniciando sesion")
        let userLoggingIn : String = "idUsuario=" + email.lowercased() + "&clave=" + password
        
        guard let url = URL(string: logInUrl + userLoggingIn) else {
            print("Invalid URL")
            return
        }
        print(url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            inProgress = true
            if let decodedResponse = try JSONDecoder().decode(UserModel?.self, from: data){
                user = decodedResponse
                print(user.nombre)
                UserDefaults.standard.set(email, forKey: "emailUser")
            }
        } catch {
            inProgress.toggle()
            loginErrors = "Usuario o contraseña incorrectos"
            print("Invalid data")
        }

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    self.isUnlocked = true
                    self.isLoggedIn = true
                    self.isPresented = true
                    self.loggingIn.append(true)
                } else {
                    print("Failed to authenticate")
                }
            }
        } else {
            inProgress.toggle()
            loginErrors = "Biometrics unavailable"
            print("Biometrics unavailable")
        }
    }
}

