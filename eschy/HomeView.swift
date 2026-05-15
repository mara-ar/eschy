//
//  HomeView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/13/26.
//

import SwiftUI
import ClerkKit

struct HomeView: View {
    @Environment(Clerk.self) private var clerk
    @EnvironmentObject private var router: Router
    
    var body: some View {
        Text("HomeView")
        Text("\(clerk.user?.primaryEmailAddress?.emailAddress ?? "no user")")
        
        Button {
            print("logging out")
            Task {
                try await clerk.auth.signOut()
                router.setPath([.login])
            }
        } label: {
            Text("Log out")
                .padding()
                .foregroundStyle(.white)
                .font(.outfit(size: 17))
                .fontWeight(.semibold)
                .background(
                    Capsule()
                        .fill(.primaryGreen)
                )
        }

    }
}

#Preview {
    HomeView()
        .environment(Clerk.preview())
}
