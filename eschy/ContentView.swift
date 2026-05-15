//
//  ContentView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI
import ClerkKit

struct ContentView: View {
    @Environment(Clerk.self) private var clerk
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            Group {
                if let _ = clerk.session {
                    HomeView()
                } else {
                    LoginView()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .login:
                    LoginView().navigationBarBackButtonHidden()
                case .home:
                    HomeView().navigationBarBackButtonHidden()
                case .register:
                    RegisterView().navigationBarBackButtonHidden()
                case .emailVerification:
                    EmailConfirmationView().navigationBarBackButtonHidden()
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
        .environment(Clerk.preview())
}
