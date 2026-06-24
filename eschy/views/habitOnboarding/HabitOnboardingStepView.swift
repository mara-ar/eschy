//
//  HabitOnboardingStepView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/14/26.
//

import SwiftUI

struct HabitOnboardingStepView: View {
    @Binding var progress: Int
    @Binding var habitData: HabitSetup
    var body: some View {
        switch progress {
        case 1:
            HabitOnboardingNameAndIcon(habitData: $habitData)
        case 2:
            HabitOnboardingReminders(habitData: $habitData)
        case 3:
            HabitOnboardingNotificationView(habitData: $habitData)
        default:
            Text("Step: \(progress)")
        }
    }
}

#Preview {
    @Previewable @State var progress: Int = 1
    @Previewable @State var onboardingHabit: HabitSetup = HabitSetup()
    HabitOnboardingStepView(progress: $progress, habitData: $onboardingHabit)
}
