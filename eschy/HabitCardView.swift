//
//  HabitCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/23/26.
//

import SwiftUI

struct HabitCardView: View {
    let habit: Habit
    let streak: Int
    let mostRecentCheckInStatus: CheckInStatus
    let nextReminder: String
    
    var body: some View {
        HStack {
            Text("\(habit.icon)")
                .font(.outfit(size: 24))
                .background(
                    Circle()
                        .fill(.iconBackground)
                        .frame(width: 44, height: 44)
                )
                .padding()
            
            VStack (alignment: .leading, spacing: 5) {
                Text("\(habit.habit)")
                    .font(.outfit(size: 14))
                    .fontWeight(.medium)
                
                HStack (spacing: 4) {
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    HStack (spacing: 2) {
                        Text("Streak:")
                            .font(.outfit(size: 12))
                            .foregroundStyle(.gray1)
                        
                        if (streak != 1) {
                            Text("\(streak) days")
                                .font(.outfit(size: 12))
                                .foregroundStyle(.secondaryOrange)
                        } else {
                            Text("\(streak) day")
                                .font(.outfit(size: 12))
                                .foregroundStyle(.secondaryOrange)
                        }
                    }
                }
            }
            
            Spacer()
            
            VStack (alignment: .trailing) {
                CheckInStatusView(status: mostRecentCheckInStatus)
                
                Text("Next Reminder: \(nextReminder)")
                    .font(.outfit(size: 12))
                    .foregroundStyle(.gray2)
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray3, lineWidth: 1)
        )
    }
}

#Preview {
    let habit = Habit(id: UUID(), habit: "computer", icon: "⌨️", createdAt: Date(), notificationContent: "do not falter")
    let streak = 6
    HabitCardView(habit: habit, streak: streak, mostRecentCheckInStatus: .success, nextReminder: "10:00 PM")
}
