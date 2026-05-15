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
    
    var body: some View {
        if let _ = clerk.session {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environment(Clerk.preview())
}
