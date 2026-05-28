//
//  ReminderCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/26/26.
//

import SwiftUI

struct ReminderCardView: View {
    let reminder: Reminder
    
    var time: String {
        "\(reminder.hour):\(reminder.minute < 10 ? "0" : "")\(reminder.minute)"
    }
    
    var checkInStatus: CheckInStatus {
        return .pending
    }
    
    var body: some View {
        HStack {
            Image("bell-04")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.reminderIconBackground)
                )
            VStack (alignment: .leading) {
                Text("\(reminder.label)")
                    .font(.outfit(size: 14))
                    .fontWeight(.medium)
                Text("\(time)")
                    .font(.outfit(size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(.gray1)
            }
            
            Spacer()
            
            CheckInStatusView(status: .pending)
        }
    }
}

#Preview {
    let reminder: Reminder = Reminder(id: UUID(), userId: UUID(), habitId: UUID(), hour: 19, minute: 0, label: "Evening reset", active: true)
    ReminderCardView(reminder: reminder)
}
