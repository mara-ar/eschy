//
//  HomeView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/13/26.
//

import SwiftUI
import AuthenticationServices
import Supabase

struct HomeView: View {
    var body: some View {
        VStack {
            Text("HomeView")
                .font(.outfit(size: 17))
            
            Button {
                print("signing out")
                Task {
                    try await supabase.auth.signOut()
                }
            } label: {
                Text("Log out")
                    .font(.outfit(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 19)
                    .background(
                        Capsule()
                            .fill(.primaryGreen)
                    )
                    .contentShape(Capsule())
                
            }
        }
        .padding()

    }
}

#Preview {
    HomeView()
}
