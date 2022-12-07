//
//  LoginView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 02/12/2022.
//
import Combine
import SwiftUI

struct LoginView: View {
    // Variables for user inputs
    @State private var email: String = ""
    @State private var loginErrors: String = ""
    @State private var password: String = ""
    
    func ingresar (){
        let ingreso = "Exitoso"
    }
    
    var body: some View {
        VStack {
            Image("logo")
            Text("Ingresa tus datos para acceder")
                .font(.title3).foregroundColor(colorSophos)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                //.offset(y:-70)
            
            HStack{
                Image(systemName: "person.circle.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                TextField("Email", text: $email)
                }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))//.offset(y:-60)
           
            HStack{
                Image(systemName: "key.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                SecureField("Password", text: $password )
                Image(systemName: "eye.fill").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).onTapGesture {
                    
                }
            }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))//.offset(y:-60)
            
            Text(loginErrors) .font(.title3).foregroundColor(Color.red)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Button(action: {
                
                // Show error message here
                if let errorMessage = self.validView() {
                    loginErrors = errorMessage
                    /*DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                       loginErrors = ""
                    }
                     */
                } else {
                    loginErrors = ""
                }
                
                // Call login API here
                /**
                 login API
                 */
                
            }){
                Text("Ingresar")
                    .bold()
                    .padding(15)
                    .frame(minWidth: 0, maxWidth:.infinity).foregroundColor(Color.white)
                    .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(colorSophos, lineWidth: 2))
            }.background(colorSophos)
                .cornerRadius(25).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                //.offset(y:-20)
            
            HStack{
                Image(systemName: "touchid")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                Button(action: ingresar){
                    Text("Ingresar con huella")
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(colorSophos)
                        .background(Color.white)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 50))
                }
            }.background(RoundedRectangle(cornerRadius: 25)
                .stroke(colorSophos, lineWidth: 2))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                //.offset(y:-20)
        }.padding()
    }
    private func validView() -> String? {
            if email.isEmpty {
                return "Email está vacío"
            }
            
            if !self.isValidEmail(email) {
                return "Email inválido"
            }
            
            if password.isEmpty {
                return "Contraseña vacía"
            }
            
            if self.password.count < 8 {
                return "Contraseña mínimo de 8 caracteres"
            }
            
            // Do same like other validation as per needed
            
            return nil
        }
        
        private func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

