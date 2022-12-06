//
//  LoginView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 02/12/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    func ingresar (){
        let ingreso = "Exitoso"
    }
    
    var body: some View {
        VStack {
            Image("logo").offset(y:-100)
            Text("Ingresa tus datos para acceder")
                .font(.title3).foregroundColor(colorSophos)
                .fontWeight(.bold)
                .multilineTextAlignment(.center).offset(y:-70)
            
            HStack{
                Image(systemName: "person.circle.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                TextField("Email", text: $email)
            }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)).offset(y:-60)
           
            HStack{
                Image(systemName: "key.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                SecureField("Password", text: $password )
                Image(systemName: "eye.fill").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).onTapGesture {
                    
                }
            }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)).offset(y:-60)
            
        
            Button(action: ingresar){
                Text("Ingresar")
                    .bold()
                    .padding(15)
                    .frame(minWidth: 0, maxWidth:.infinity).foregroundColor(Color.white)
                    .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(colorSophos, lineWidth: 2))
            }.background(colorSophos)
                .cornerRadius(25).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                .offset(y:-20)
            
            Button(action: ingresar){
                Text("Ingresar con huella")
                    .bold()
                    .padding(15)
                    .frame(minWidth: 0, maxWidth: .infinity
                    ).foregroundColor(colorSophos).background(Color.white)
                    .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(colorSophos, lineWidth: 2))
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                .offset(y: -20)
            
        }
        .padding()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
