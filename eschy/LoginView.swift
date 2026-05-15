//
//  LoginView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI
import ClerkKit

struct LoginView: View {
    @Environment(Clerk.self) private var clerk
    @EnvironmentObject private var router: Router
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    @State private var loading: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gradient)
                .frame(height: 500)
                .offset(y: -300)
                .blur(radius: 166)
            VStack (spacing: 25) {
                Text("eschy")
                    .font(.outfit(size: 48))
                    .foregroundStyle(.primaryGreen)
                    .fontWeight(.semibold)
                    .padding(.top, 100)
                    .padding(.bottom, 50)
                VStack (spacing: 10) {
                    Text("Your personal why in your pocket")
                        .font(.outfit(size: 24))
                        .fontWeight(.medium)
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
                    
                    SecureField("", text: $password)
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
                
                VStack {
                    Button {
                        // TODO: vanilla sign in
                        print("sign in button")
                        
                        Task {
                            do {
                                loading = true
                                var result = try await  clerk.auth.signInWithPassword(identifier: "\(email)", password: "\(password)")
                                
                                print(result)
                                
                                loading = false
                                if let _ = clerk.session {
                                    router.setPath([.home])
                                }
                            } catch {
                                print("\(type(of: error))")
                                let clerkError = error as? ClerkAPIError
                                errorMessage = clerkError?.message ?? "Unknown error"
                                errorMessage = errorMessage.replacingOccurrences(of: "Identifier", with: "Email")
                                errorMessage = errorMessage.replacingOccurrences(of: "identifier", with: "email")
                            }
                        }
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
                    
                    if (errorMessage != "") {
                        Text("\(errorMessage)")
                            .font(.outfit(size: 10))
                            .fontWeight(.medium)
                            .foregroundStyle(.red)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                    }
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
                    Button {
                        // TODO: google sign in
                        print("signing in with google")
                        Task {
                            loading = true
                            var result = try await clerk.auth.signInWithOAuth(provider: .google)
                            loading = false
                            if let _ = clerk.session {
                                router.setPath([.home])
                            }
                        }
                        
                    } label: {
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
                    }
                    Spacer()
                    Button {
                        // TODO: apple sign in
                        print("sign in with apple")
                        Task {
                            loading = true
                            var result = try await clerk.auth.signUpWithApple()
                            loading = false
                            if let _ = clerk.session {
                                router.setPath([.home])
                            }
                        }
                    } label: {
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
                    }
                    Spacer()
                    Button {
                        // TODO: discord sign in
                        print("sign in with discord")
                        Task {
                            loading = true
                            var result = try await clerk.auth.signInWithOAuth(provider: .discord)
                            loading = false
                            if let _ = clerk.session {
                                router.setPath([.home])
                            }
                        }
                    } label: {
                        Image("discord-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clear)
                                    .stroke(.gray3, lineWidth: 1)
                                    .frame(width: 50, height: 50)
                            )
                    }
                    Spacer()
                }
                
                Spacer()
                
                HStack (spacing: 5) {
                    Text("Don't have an account?")
                        .font(.outfit(size: 10))
                        .fontWeight(.light)
                        .foregroundStyle(.gray1)
                    Button {
                        // TODO: implement going to sign in page
                        print("go to sign up page")
                        
                        router.push(to: .register)
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
        .blur(radius: loading ? 10 : 0)
        .overlay {
            if loading {
                LoadingView()
            }
        }
        
    }
}

#Preview {
    LoginView()
        .environment(Clerk.preview())
}
