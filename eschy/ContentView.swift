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
    @StateObject private var quickActionsState = QuickActionsState()
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
                    case .main:
                        MainView().navigationBarBackButtonHidden()
                    case .insights:
                        InsightsView().navigationBarBackButtonHidden()
                    }
                }
        }
        .environmentObject(router)
        .environmentObject(quickActionsState)
        .task {
            let user: User? = try? await supabase.auth.user()
            var transation = Transaction()
            transation.disablesAnimations = true
            if user != nil {
                withTransaction(transation) {
                    router.setPath([.main])
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
                    router.setPath([.main])
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
