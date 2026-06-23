//
//  HabitOnboardingReminders.swift
//  eschy
//
//  Created by Abhinav Mara on 6/22/26.
//

import SwiftUI

struct HabitOnboardingReminders: View {
    @Binding var habitData: HabitSetup
    @State private var isPresented: Bool = false
    @State private var selectedTime = Date()
    var body: some View {
        VStack (spacing: 16) {
            VStack (spacing: 20) {
                Text("When do you usually feel the urge?")
                    .font(.outfit(size: 20))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if habitData.reminders.count == 0 {
                    VStack {
                        Spacer()
                        Text("No reminders yet")
                            .font(.outfit(size: 16))
                        Spacer()
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .stroke(.gray3, lineWidth: 1)
                    )
                } else {
                    List ($habitData.reminders) { $reminderData in
                        HabitOnboardingReminderCardView(reminderData: $reminderData)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button (role: .destructive) {
                                    print("delete reminder")
                                    print(habitData.reminders)
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                            }
                    }
                    .scrollIndicators(.hidden)
                    .listStyle(.plain)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .stroke(.gray3, lineWidth: 1)
                    )
                }
            }
            
            Button {
                print("add reminder")
                isPresented = true
            } label: {
                HStack (spacing: 6) {
                    Image(systemName: "plus")
                    Text("Add Time")
                        .font(.outfit(size: 14))
                }
                .foregroundStyle(.black)
                .padding(.vertical, 13)
                .padding(.horizontal, 15)
                .background(
                    Capsule()
                        .stroke(.gray3, lineWidth: 2)
                )
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .sheet(isPresented: $isPresented) {
            HabitOnboardingAddRemindersView(isPresented: $isPresented, habitData: $habitData)
        }
        
    }
}

func scaledNumber(val: Double) -> Double {
    if val == 0 {
        return 1
    }
    
    return 1 - abs(val)
}

#Preview {
    @Previewable @State var habitData = HabitSetup()
    HabitOnboardingReminders(habitData: $habitData)
}
