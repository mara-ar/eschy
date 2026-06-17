//
//  HabitCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/23/26.
//

import SwiftUI

struct HabitCardView: View {
    let habit: Habit
    
    var body: some View {
        VStack {
            VStack (spacing: 10) {
                Text("\(habit.icon)")
                    .font(.outfit(size: 36))
                Text("\(habit.habit)")
                    .font(.outfit(size: 14))
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .frame(maxWidth: 90)
                HStack (spacing: 5) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.red)
                    Text("\(habit.streak)")
                }
                .frame(width: 63)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.gray.opacity(0.1))
                )
            }
            .padding(.vertical, 11)
            .frame(width: 105)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray3, lineWidth: 1)
            )
        }
    }
}

#Preview {
//    HabitCardView(habitId: UUID())
}
