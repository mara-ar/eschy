//
//  HabitOnboardingMotivationCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/30/26.
//

import SwiftUI

struct HabitOnboardingMotivationCardView: View {
    @Binding var habitData: HabitSetup
    @State private var isAnimating: Bool = false
    
    var body: some View {
        if let motivationType = habitData.motivationConfig.type {
            if motivationType == .text {
                VStack {
                    Text("Text")
                        .font(.outfit(size: 16))
                        .fontWeight(.semibold)
                    Text("\(habitData.motivationConfig.textContent ?? "")")
                        .truncationMode(.tail)
                        .lineLimit(3)
                }
                .motivationCardAnimation(isAnimating: $isAnimating)
                .onAppear { isAnimating = true }
            } else if motivationType == .image {
                if let imageData = habitData.motivationConfig.image {
                    VStack {
                        Text("Image")
                            .font(.outfit(size: 16))
                            .fontWeight(.semibold)
                        Image(uiImage: UIImage(data: imageData)!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    .motivationCardAnimation(isAnimating: $isAnimating)
                    .onAppear { isAnimating = true }
                }
            } else {
                Text("Video Motivation")
            }
        } else {
            Text("No Motivation Selected")
        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 12)
//                .fill(.white)
//                .shadow(color: .gray3, radius: 10, y: 5)
//        )
//        .offset(y: isAnimating ? 0 : 25)
//        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
        
    }
}



#Preview {
//    HabitOnboardingMotivationCardView()
}
