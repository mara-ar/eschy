//
//  eschyApp.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI

@main
struct eschyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .font(.custom("Outfit", size: 17))
                .preferredColorScheme(.light)
        }
    }
}

extension Font {
    public static func outfit(size: CGFloat) -> Font {
        return Font.custom("Outfit", size: size)
    }
}
