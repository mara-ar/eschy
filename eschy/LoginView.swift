//
//  LoginView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gradient)
                .frame(height: 500)
                .offset(y: -300)
                .blur(radius: 166)
            VStack (spacing: 25) {
                VStack (spacing: 25) {
                    Text("eschy")
                        .font(.outfit(size: 48))
                        .foregroundStyle(.primaryGreen)
                        .fontWeight(.semibold)
                        .padding(.top, 100)
                        .padding(.bottom, 50)
                    VStack (spacing: 10) {
                        Text("Your personal why right in your pocket")
                            .font(.outfit(size: 24))
                            .foregroundStyle(.primaryGreen)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Sign in to get started on your addiction free journey")
                            .font(.outfit(size: 14))
                            .foregroundStyle(.gray2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack (spacing: 10) {
                        TextField("", text: $email)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .padding(.top, 20)
                            .padding(.leading, 12)
                            .padding(.bottom, 5)
                            .font(.outfit(size: 14))
                            .frame(height: 45)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray3, lineWidth: 1)
                            }
                            .overlay {
                                Text("Email")
                                    .font(.outfit(size: 12))
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                    .padding(.leading, 12)
                                    .padding(.top, 5)
                            }
                        
                        TextField("", text: $password)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .padding(.top, 20)
                            .padding(.leading, 12)
                            .padding(.bottom, 5)
                            .font(.outfit(size: 14))
                            .frame(height: 45)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray3, lineWidth: 1)
                            }
                            .overlay {
                                Text("Password")
                                    .font(.outfit(size: 12))
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                    .padding(.leading, 12)
                                    .padding(.top, 5)
                            }
                    }
                    
                    Button {
                        print("sign in button")
                    } label: {
                        Text("Login")
                            .font(.outfit(size: 14))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 19)
                            .background(
                                Capsule()
                                    .fill(.primaryGreen)
                            )
                            .foregroundStyle(.white)
                            .contentShape(Capsule())
                    }
                    
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray2)
                        Text("or continue with")
                            .font(.outfit(size: 14))
                            .foregroundStyle(.gray2)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray2)
                    }
                    
                    HStack {
                        Spacer()
                        Image("google-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clear)
                                    .stroke(.gray3, lineWidth: 1)
                                    .frame(width: 50, height: 50)
                            )
                        Spacer()
                        Image("apple-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clear)
                                    .stroke(.gray3, lineWidth: 1)
                                    .frame(width: 50, height: 50)
                            )
                        Spacer()
                        Image("x-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clear)
                                    .stroke(.gray3, lineWidth: 1)
                                    .frame(width: 50, height: 50)
                            )
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack (spacing: 5) {
                        Text("Don't have an account?")
                            .font(.outfit(size: 10))
                            .fontWeight(.light)
                            .foregroundStyle(.gray1)
                        Button {
                            print("go to sign up page")
                        } label: {
                            Text("Sign up here")
                                .font(.outfit(size: 10))
                                .fontWeight(.semibold)
                                .foregroundStyle(.primaryGreen)
                        }
                        
                    }
                    
                }
                .padding(.horizontal, 25)
            }
        }
        
    }
}

#Preview {
    LoginView()
}
