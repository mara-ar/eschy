//
//  HabitOnboardingReminderCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/22/26.
//

import SwiftUI

struct HabitOnboardingReminderCardView: View {
    @Binding var reminderData: ReminderData
    var body: some View {
        if let hour = reminderData.hour, let minute = reminderData.minute, let label = reminderData.label {
            HStack {
                Image("clock")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray3.opacity(0.5))
                    )
                    .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
                
                VStack (alignment: .leading) {
                    Text("\(hour):\(minute < 10 ? "0" : "")\(minute)")
                        .font(.outfit(size: 16))
                        .fontWeight(.semibold)
                    Text("\(label)")
                        .font(.outfit(size: 11))
                        .foregroundStyle(.gray1)
                }
                
                Spacer()
                
                Toggle("reminder on", isOn: $reminderData.isOn)
                    .toggleStyle(.customSwitch)
            }
        }
        
    }
}


#Preview {
    @Previewable @State var reminderData = ReminderData(hour: 9, minute: 0, label: "Morning")
    HabitOnboardingReminderCardView(reminderData: $reminderData)
}
