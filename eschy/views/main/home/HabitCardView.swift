//
//  HabitCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/23/26.
//

import SwiftUI

struct HabitCardView: View {
    @EnvironmentObject private var router: Router
    let habit: Habit
    
    var body: some View {
        Button {
            router.push(to: .habit(habitId: habit.id))
        } label: {
            VStack {
                VStack (spacing: 10) {
                    Text("\(habit.icon)")
                        .font(.outfit(size: 36))
                    Text("\(habit.habit)")
                        .font(.outfit(size: 14))
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .frame(maxWidth: 120)
                        .padding(.horizontal, 10)
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
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
//    HabitCardView(habitId: UUID())
}
