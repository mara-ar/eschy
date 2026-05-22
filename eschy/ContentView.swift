//
//  ContentView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI
import Supabase

struct ContentView: View {
    @StateObject private var router = Router()
    @State private var renderHome: Bool = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
            LoadingView(spinnerColor: .primaryGreen)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .login:
                        LoginView().navigationBarBackButtonHidden()
                    case .home:
                        HomeView().navigationBarBackButtonHidden()
                    case .register:
                        RegisterView().navigationBarBackButtonHidden()
                    case .emailVerification(let email):
                        EmailConfirmationView(email: email).navigationBarBackButtonHidden()
                    }
                }
        }
        .environmentObject(router)
        .task {
            let user: User? = try? await supabase.auth.user()
            var transation = Transaction()
            transation.disablesAnimations = true
            if user != nil {
                withTransaction(transation) {
                    router.setPath([.home])
                }
            } else {
                withTransaction(transation) {
                    router.setPath([.login])
                }
            }
        }
        .task {
            for await (event, _) in supabase.auth.authStateChanges {
                switch event {
                case.signedOut:
                    print("user signed out")
                    router.setPath([.login])
                case .signedIn:
                    print("user signed in")
                    router.setPath([.home])
                default:
                    break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
