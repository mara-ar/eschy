//
//  ReminderStatusView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/28/26.
//

import SwiftUI

struct ReminderStatusView: View {
    let status: ReminderStatus
    
    var body: some View {
        switch status {
        case .completed:
            HStack (spacing: 6) {
                Circle()
                    .fill(.green)
                    .frame(width: 5, height: 5)
                Text("Completed")
                    .font(.outfit(size: 11))
            }
            .frame(width: 84, height: 24)
            .background(
                Capsule()
                    .stroke(.gray3, lineWidth: 1)
            )
        case .missed:
            HStack (spacing: 6) {
                Circle()
                    .fill(.red)
                    .frame(width: 5, height: 5)
                Text("Missed")
                    .font(.outfit(size: 11))
            }
            .frame(width: 84, height: 24)
            .background(
                Capsule()
                    .stroke(.gray3, lineWidth: 1)
            )
        case .upcoming:
            HStack (spacing: 6) {
                Circle()
                    .fill(.yellow)
                    .frame(width: 5, height: 5)
                Text("Upcoming")
                    .font(.outfit(size: 11))
            }
            .frame(width: 84, height: 24)
            .background(
                Capsule()
                    .stroke(.gray3, lineWidth: 1)
            )
        default:
            Text("default")
        }
    }
}

enum ReminderStatus {
    case completed
    case missed
    case upcoming
}

#Preview {
    ReminderStatusView(status: .upcoming)
}
