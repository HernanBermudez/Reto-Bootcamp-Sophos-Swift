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
    @ObservedObject var loginVM = ViewModel()
    @EnvironmentObject var authentication: Authentication
    @State var complete: Bool = false
    @State var inProgress: Bool = false
    
    var body: some View {
        NavigationStack(path: $loginVM.loggingIn){
            VStack {
                Image("logo")
                Text("Ingresa tus datos para acceder")
                    .font(.title3).foregroundColor(colorSophos)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                //.offset(y:-70)
                
                HStack{
                    Image(systemName: "person.circle.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                    TextField("Email", text: $loginVM.email)
                }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))//.offset(y:-60)
                
                HStack{
                    Image(systemName: "key.fill").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                    SecureField("Password", text: $loginVM.password )
                    Image(systemName: "eye.fill").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).onTapGesture {
                        
                    }
                }.background(RoundedRectangleInput()).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))//.offset(y:-60)
                
                Text(loginVM.loginErrors) .font(.title3).foregroundColor(Color.red)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                AsyncButton(isComplete: loginVM.isLoggedIn, action: {
                    if let errorMessage = loginVM.validView(email: loginVM.email, password: loginVM.password) {
                        loginVM.loginErrors = errorMessage
                        
                    } else {
                        loginVM.loginErrors = ""
                        Task{
                            await loginVM.logIn(email: loginVM.email, password: loginVM.password)
                            withAnimation { complete = loginVM.isLoggedIn }
                        }
                    }
                }) {
                    Text(complete || inProgress ? "" : "Ingresar")
                }
                
                HStack{
                    Image(systemName: "touchid")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    Button(action: {}){
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
                .navigationDestination(for: Bool.self){_ in
                    HomeView()
                }
        }.environmentObject(loginVM)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()        
    }
}
