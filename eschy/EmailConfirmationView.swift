//
//  EmailConfirmationView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/13/26.
//

import SwiftUI
import Supabase

struct EmailConfirmationView: View {
    let email: String
    
    @EnvironmentObject private var router: Router
    @State private var verifying: Bool = false
    @State private var passcode: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack (spacing: 30) {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(.primaryGreen)
            VStack {
                Text("Enter the passcode sent to ")
                    .font(.outfit(size: 16))
                    .multilineTextAlignment(.center)
                Text("\(email)")
                    .font(.outfit(size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.primaryGreen)
                    .multilineTextAlignment(.center)
                HStack {
                    TextField("", text: $passcode)
                        .font(.outfit(size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 200)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 2)
                        }
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                }
            }
            Button {
                // TODO: verify passcode
                print("verify code")
                Task {
                    verifying = true
                    try await supabase.auth.verifyOTP(email: email, token: "\(passcode)", type: .signup)
                    verifying = false
                    router.setPath([.home])
                }
            } label: {
                Text("Verify")
                    .font(.outfit(size: 17))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 19)
                    .padding(.horizontal, 38)
                    .background(
                        Capsule()
                            .fill(.primaryGreen)
                    )
            }
        }
        .blur(radius: verifying ? 10 : 0)
        .overlay {
            if verifying {
                LoadingView()
            }
        }
        .onAppear {
            isFocused = true
        }
        
    }
}

#Preview {
    EmailConfirmationView(email: "grey.reaper01@gmail.com")
}
