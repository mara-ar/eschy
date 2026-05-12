//
//  LoadingView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/12/26.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0.2, to: 0.7)
                .stroke(.primaryGreen, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .frame(width: 25, height: 25)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : -360))
                .animation(
                    .linear(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: isAnimating
                )
                .onAppear {
                    isAnimating = true
                }
            
            Text("Loading")
                .font(.outfit(size: 24))
                .fontWeight(.regular)
                .foregroundStyle(.primaryGreen)
        }
    }
}

#Preview {
    LoadingView()
}
