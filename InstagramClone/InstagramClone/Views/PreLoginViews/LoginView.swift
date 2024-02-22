//
//  LoginView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 18/12/23.
//

import SwiftUI

struct LoginView: View {
    @State var email : String = ""
    @State var password : String = ""
    @FocusState private var usernamIsFocused: Bool
    @FocusState private var passwordIsFocused : Bool
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .fill(.background)
                    .onTapGesture {
                        usernamIsFocused = false
                        passwordIsFocused = false
                    }
                VStack{
                    VStack{
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150, alignment: .center)
                        TextField("Username or email address", text: $email)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(Color.primary)
                            .background(Color.myGrey)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            }
                            .focused($usernamIsFocused)
                        SecureField("Password", text: $password)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(Color.primary)
                            .background(Color.myGrey)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            }
                            .overlay(alignment: .trailing) {
                                Button(action: {}, label: {
                                    Image(systemName: "eye.slash")
                                        .padding(.horizontal)
                                        .foregroundStyle(.gray)
                                }
                                )
                                
                            }
                            .focused($passwordIsFocused)
                            
                        
                        HStack{
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Forgotten password?")
                                    .bold()
                                    .font(.footnote)
                            }
                        }.padding(.vertical)
                        
                        Button(action: {
                            usernamIsFocused = false
                            passwordIsFocused = false
                        }, label: {
                            Text("Log In")
                                .font(.callout)
                                .bold()
                        })
                        .frame(width: UIScreen.main.bounds.width-50, height: 40)
                        .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        Spacer()
                        
                    }.padding()
                    Divider()
                    HStack{
                        Text("Dont have an account?")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                        
                        NavigationLink {
                            SignUpView()
                        } label: {
                            Text("Sign Up")
                                .font(.subheadline)
                        }
                        .navigationTitle("")
                        
        
                    }.padding()
                }
                
            }
        }
        
       
        
    }
}

#Preview {
    LoginView()
}
