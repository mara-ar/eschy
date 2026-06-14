//
//  HabitOnboardingView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/8/26.
//

import SwiftUI

struct HabitOnboardingView: View {
    @State private var progress: Int = 1
    var body: some View {
        VStack (spacing: 20) {
            VStack (spacing: 32) {
                HStack {
                    Button {
                        withAnimation(.easeInOut) {
                            if progress > 1 {
                                progress -= 1
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Spacer()
                    CreateHabitProgressView(progress: $progress)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                HabitOnboardingStepView(progress: $progress)
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut) {
                    if progress < 5 {
                        progress += 1
                    }
                }
            } label: {
                Text("Continue")
                    .font(.outfit(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 19)
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .fill(.primaryGreen)
                            .frame(maxWidth: .infinity)
                    )
            }
        }
        .padding(.top, 16)
    }
}

#Preview {
    HabitOnboardingView()
}
