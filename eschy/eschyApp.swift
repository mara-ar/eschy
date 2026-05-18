//
//  eschyApp.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI
import GoogleSignIn

@main
struct eschyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .font(.outfit(size: 17))
                .preferredColorScheme(.light)
//                .onOpenURL { url in
//                          GIDSignIn.sharedInstance.handle(url)
//                        }
        }
    }
}

extension Font {
    public static func outfit(size: CGFloat) -> Font {
        return Font.custom("Outfit", size: size)
    }
}
