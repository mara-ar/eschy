//
//  RegisterView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/12/26.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var router: Router
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password1: String = ""
    @State private var password2: String = ""
    
    @State private var loading: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gradient)
                .frame(height: 500)
                .offset(y: -300)
                .blur(radius: 166)
            VStack (spacing: 25) {
                VStack (spacing: 10) {
                    Text("Start your habit-breaking journey right now, right here")
                        .font(.outfit(size: 24))
                        .fontWeight(.medium)
                        .foregroundStyle(.primaryGreen)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Sign up to start breaking your bad habits one by one")
                        .font(.outfit(size: 14))
                        .foregroundStyle(.gray2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack {
                    TextField("", text: $username)
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
                            Text("Username")
                                .font(.outfit(size: 12))
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading, 12)
                                .padding(.top, 5)
                        }
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
                    SecureField("", text: $password1)
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
                    SecureField("", text: $password2)
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
                            Text("Confirm password")
                                .font(.outfit(size: 12))
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading, 12)
                                .padding(.top, 5)
                        }
                }
                Button {
                    // TODO: create a new user
                    print("register button")
                } label: {
                    Text("Register")
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
            }
            .padding()
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
    RegisterView()
}
