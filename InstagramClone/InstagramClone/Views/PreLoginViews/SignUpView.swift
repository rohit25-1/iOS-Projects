//
//  SignUpView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 30/12/23.
//

import SwiftUI

struct SignUpView: View {
    @State var username : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var confirmPassword : String = ""
    @FocusState private var usernamIsFocused: Bool
    @FocusState private var emailIsFocused: Bool
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
                        TextField("Username", text: $username)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(Color.primary)
                            .background(Color.myGrey)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            }.padding(.vertical,5)
                            .focused($usernamIsFocused)
                        TextField("Email", text: $email)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(Color.primary)
                            .background(Color.myGrey)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            }.padding(.vertical,5)
                            .focused($emailIsFocused)
                        SecureField("Password", text: $password)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(Color.primary)
                            .background(Color.myGrey)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            }
                            .padding(.vertical,5)
                            .focused($passwordIsFocused)
        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(Color.primary)
                            .background(Color.myGrey)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            }
                            .padding(.vertical,5)
                            .focused($passwordIsFocused)
                            
                        
                        Button(action: {
                            usernamIsFocused = false
                            passwordIsFocused = false
                        }, label: {
                            Text("Sign Up")
                                .font(.callout)
                                .bold()
                        })
                        .frame(width: UIScreen.main.bounds.width-50, height: 40)
                        .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding()
                        Spacer()
                        
                    }.padding()
                    Divider()
                    HStack{
                        Text("Already have an account?")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                        Button(action: {
                            
                        }, label: {
                            Text("Log In")
                                .font(.subheadline)
                        })
                    }.padding()
                }
                
            }.navigationBarBackButtonHidden()
        }
        
        
    }
}

#Preview {
    SignUpView()
}
