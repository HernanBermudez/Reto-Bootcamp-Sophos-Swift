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
    @ObservedObject var loginVM = LoginViewModel()
    @ObservedObject var officesVM = OfficesViewModel()
    @ObservedObject var seeDocumentsVM = SeeDocumentsViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        NavigationSplitView{
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation {loginVM.isLoggedIn = true}
                        }
                        Task{
                            await loginVM.logIn(email: loginVM.email, password: loginVM.password)
                            await officesVM.fetchOffices()
                            await seeDocumentsVM.fetchDocuments(email: loginVM.email)
                            await seeDocumentsVM.fetchImageDocument(registro: seeDocumentsVM.registerId)
                        }
                    }
                }) {
                    NavigationLink(loginVM.isLoggedIn || loginVM.inProgress ? "" : "Ingresar", value: true)
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
                .navigationDestination(isPresented: $loginVM.isPresented, destination: {
                    NavigationStack{
                        HomeView()
                    }
                })
        } detail: {
            
        }.environmentObject(loginVM)
            .environmentObject(officesVM)
            .environmentObject(seeDocumentsVM)
            .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()        
    }
}
