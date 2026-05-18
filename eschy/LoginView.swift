//
//  LoginView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI
import ClerkKit
import Supabase
import AuthenticationServices

struct LoginView: View {
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
            VStack (spacing: 15) {
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
                
                VStack (spacing: 10) {
                    Button {
                        // TODO: google sign in
                        print("signing in with google")
                        
                        Task {
                            try await supabase.auth.signInWithOAuth(provider: .google)
                            
                            let user = try await supabase.auth.user()
                            
                            print(user)
                            
                            router.setPath([.home])
                        }
                    } label: {
                        HStack (spacing: 5) {
                            Image("google-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 13)
                                .padding(.top, 0.5)
                            Text("Continue with Google")
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.outfit(size: 16))
                        .foregroundStyle(.gray1)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .overlay {
                            Capsule()
                                .fill(.clear)
                                .stroke(.gray3, style: StrokeStyle(lineWidth: 2))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    SignInWithAppleButton(.continue) { request in
                        request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result  in
                        Task {
                            do {
                                guard let credential = try result.get().credential as? ASAuthorizationAppleIDCredential else { return }
                                
                                guard let idToken = credential.identityToken.flatMap({String(data: $0, encoding: .utf8)})
                                else {
                                    return
                                }
                                
                                try await supabase.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken))
                                
                                router.setPath([.home])
                            }
                        }
                    }
                    .clipShape(Capsule())
//                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    
                    Button {
                        // TODO: discord sign in
                        print("signing in with discord")
                        
                        Task {
                            try await supabase.auth.signInWithOAuth(provider: .discord)
                            
                            let user = try await supabase.auth.user()
                            
                            print(user)
                            
                            router.setPath([.home])
                        }
                    } label: {
                        HStack (spacing: 5) {
                            Image("discord-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 13)
                                .padding(.top, 0.5)
                            Text("Continue with Discord")
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.outfit(size: 16))
                        .foregroundStyle(.gray1)
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .overlay {
                            Capsule()
                                .fill(.clear)
                                .stroke(.gray3, style: StrokeStyle(lineWidth: 2))
                                .frame(maxWidth: .infinity)
                        }
                    }

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
}
