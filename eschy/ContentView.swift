//
//  ContentView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Button!")
                .font(.custom("Outfit", size: 17))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
