//
//  ReminderCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/26/26.
//

import SwiftUI

struct ReminderCardView: View {
    let reminder: Reminder
    @State private var habitModel: HabitModel = HabitModel()
    @State private var habitIcon: String?
    
    var time: String {
        "\(reminder.hour):\(reminder.minute < 10 ? "0" : "")\(reminder.minute)"
    }
    
    var reminderStatus: ReminderStatus {
        let currentHour = Calendar.current.component(.hour, from: Date())
        let currentMinute = Calendar.current.component(.minute, from: Date())
        if reminder.hour > currentHour {
            return .upcoming
        } else if reminder.hour == currentHour {
            if reminder.minute > currentMinute {
                return .upcoming
            } else {
                if reminder.checkedIn {
                    return .completed
                } else {
                    return .missed
                }
            }
        } else {
            if reminder.checkedIn {
                return .completed
            } else {
                return .missed
            }
        }
    }
    
    var body: some View {
        HStack {
            Image("bell-04")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.reminderIconBackground)
                )
                .padding(.trailing, 5)
            VStack (alignment: .leading, spacing: 5) {
                Text("\(reminder.label)")
                    .font(.outfit(size: 14))
                    .fontWeight(.medium)
                HStack (alignment: .center) {
                    Text("\(time)")
                        .font(.outfit(size: 12))
                        .fontWeight(.regular)
                        .foregroundStyle(.gray1)
                    Circle()
                        .frame(width: 2, height: 2)
                        .foregroundStyle(.gray1)
                    Text("\(habitIcon ?? "")")
                        .font(.outfit(size: 12))
                }
            }
            
            Spacer()
            
            ReminderStatusView(status: reminderStatus)
        }
        .task {
            if let habit = await habitModel.fetchHabitById(id: reminder.habitId) {
                habitIcon = habit.icon
            }
        }
    }
}

#Preview {
    let reminder: Reminder = Reminder(id: UUID(), userId: UUID(), habitId: UUID(), hour: 19, minute: 0, label: "Evening reset", active: true, checkedIn: false)
    ReminderCardView(reminder: reminder)
}
