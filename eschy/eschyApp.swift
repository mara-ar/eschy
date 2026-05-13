//
//  eschyApp.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI
import ClerkKit

@main
struct eschyApp: App {
    init() {
        Clerk.configure(publishableKey: "pk_test_dG9nZXRoZXItZ25hdC01My5jbGVyay5hY2NvdW50cy5kZXYk")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .font(.outfit(size: 17))
                .preferredColorScheme(.light)
                .environment(Clerk.shared)
        }
    }
}

extension Font {
    public static func outfit(size: CGFloat) -> Font {
        return Font.custom("Outfit", size: size)
    }
}
