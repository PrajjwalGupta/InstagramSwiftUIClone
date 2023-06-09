//
//  LoginView.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 25/04/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                
                VStack(spacing: 20) {
                   Image("instagramlogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100, alignment: .center)
                        .foregroundColor(Color.white)
                       
                   
                    
                    // email field
                    
                    VStack (spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        
                        
                        //password field
                        
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: {
                            ResetPasswordView(email: $email)
                        }, label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 35)
                        })
                    }
                    
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 320, height: 50)
                            .background(Color(.systemPurple))
                            .cornerRadius(10)
                            .padding()
                    })
                    Spacer()
                    
                    NavigationLink (destination: RegistrationView().navigationBarHidden(true), label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                                
                        }.foregroundColor(.white)
                    }).padding(.bottom, 22)
                    
                }
                .padding(.top, -44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
