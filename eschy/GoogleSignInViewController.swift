//
//  GoogleSignInViewController.swift
//  eschy
//
//  Created by Abhinav Mara on 5/18/26.
//

import Foundation
import GoogleSignIn
import Supabase

class GoogleSignInViewController: UIViewController {
    func googleSignIn() async throws {
//        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: self)
//        
//        guard let idToken = result.user.idToken?.tokenString else {
//            print("No id token found")
//            return
//        }
//        
//        let accessToken = result.user.accessToken.tokenString
//        
//        try await supabase.auth.signInWithIdToken(
//            credentials: OpenIDConnectCredentials(
//                provider: .google,
//                idToken: idToken,
//                accessToken: accessToken,
//            )
//        )
        
        try await supabase.auth.signInWithOAuth(provider: .google)
        
        let user = try await supabase.auth.user()
        
        print(user)
    }
}
