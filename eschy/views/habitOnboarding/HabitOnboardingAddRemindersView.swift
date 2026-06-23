//
//  HabitOnboardingAddRemindersView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/23/26.
//

import SwiftUI

struct HabitOnboardingAddRemindersView: View {
    @Binding var isPresented: Bool
    @Binding var habitData: HabitSetup
    @State var label: String = ""
    @State var hourSelection: Int? = 0
    @State var minuteSelection: Int? = 0
    @State var middayPeriodSelection: Int? = 0
    
    var hours: [String] {
        let hours = Array(1...12).map { m in
            if m < 10 {
                return "0\(m)"
            }
            return "\(m)"
        }
        return hours
    }
    
    var minutes: [String] {
        let minutes = Array(0...60).map { m in
            if m < 10 {
                return "0\(m)"
            }
            return "\(m)"
        }
        return minutes
    }
    
    var middayPeriods: [String] {
        return ["AM", "PM"]
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Add Time")
                    .font(.outfit(size: 16))
                    .fontWeight(.semibold)
                Spacer()
            }
            Divider()
            
            TimePickerView(hourSelection: $hourSelection, minuteSelection: $minuteSelection, middayPeriodSelection: $middayPeriodSelection, hours: hours, minutes: minutes, middayPeriods: middayPeriods)
            
            VStack (alignment: .leading, spacing: 12) {
                Text("Add a Label")
                    .font(.outfit(size: 12))
                    .padding(.horizontal, 16)
                TextField("", text: $label)
                    .font(.outfit(size: 16))
                    .fontWeight(.medium)
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray3, lineWidth: 1)
            )
            
            Spacer()
            
            Button {
                // TODO: create reminder
                print("create reminder at \(hours[hourSelection!]):\(minutes[minuteSelection!]) \(middayPeriods[middayPeriodSelection!])")
                isPresented = false
                habitData.reminders.append(ReminderData(hour: Int(hours[hourSelection!]), minute: Int(minutes[minuteSelection!]), label: label))
            } label: {
                Text("Create Reminder")
                    .font(.outfit(size: 14))
                    .fontWeight(.semibold)
                    .padding(.vertical, 19)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        Capsule()
                            .fill(.primaryGreen)
                    )
            }
        }
        .padding(.vertical, 30)
        .padding(.horizontal)
        .presentationBackground(.white)
    }
}

#Preview {
//    HabitOnboardingAddRemindersView()
}
