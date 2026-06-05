//
//  HabitCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/23/26.
//

import SwiftUI

struct HabitCardView: View {
    let habitId: UUID
    @State private var habitModel: HabitModel = HabitModel()
    @State private var checkInModel: CheckInModel = CheckInModel()
    @State private var habit: Habit?
    @State private var streak: Int?
    
    var body: some View {
        VStack {
            if let habit = habit {
                VStack (spacing: 10) {
                    Text("\(habit.icon)")
                        .font(.outfit(size: 36))
                    Text("\(habit.habit)")
                        .font(.outfit(size: 14))
                        .fontWeight(.medium)
                    HStack (spacing: 5) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                        if let streak = streak {
                            Text("\(streak)")
                        }
                    }
                    .frame(width: 63)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.gray.opacity(0.1))
                    )
                }
                .padding(.vertical, 11)
                .frame(width: 113)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )
            }
        }
        .task {
            habit = await habitModel.fetchHabitById(id: habitId)
            let checkIn = await checkInModel.fetchLatestCheckInByHabitId(habitId: habitId)
            var relapseDate: Date
            
            if let checkIn = checkIn {
                relapseDate = checkIn.createdAt
                let today = Date()
                let differenceInSeconds = today.timeIntervalSince(relapseDate)
                
                streak = Int(differenceInSeconds) / (60 * 60 * 24)
            } else {
                if let habit = habit {
                    relapseDate = habit.createdAt
                    let today = Date()
                    let differenceInSeconds = today.timeIntervalSince(relapseDate)
                    
                    streak = Int(differenceInSeconds) / (60 * 60 * 24)
                }
            }
        }
    }
}

#Preview {
    HabitCardView(habitId: UUID())
}
