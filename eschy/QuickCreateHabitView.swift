//
//  QuickCreateHabitView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/7/26.
//

import SwiftUI

struct QuickCreateHabitView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create")
                .font(.outfit(size: 16))
                .fontWeight(.semibold)
            Button {
                // TODO: direct to habit onboarding
                print("create a new habit")
            } label: {
                HStack {
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Habit")
                            .font(.outfit(size: 14))
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                        Text("Create new habit")
                            .font(.outfit(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.gray1)
                    }
                    
                    Spacer()
                    
                    Image("file")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36)
                        .foregroundStyle(.black)
                }
                .padding(18)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )
            }
        }
        .padding()
    }
}

#Preview {
    QuickCreateHabitView()
}
