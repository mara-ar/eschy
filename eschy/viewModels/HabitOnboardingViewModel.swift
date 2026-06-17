//
//  HabitOnboardingViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
internal import Combine

final class HabitOnboardingViewModel: ObservableObject {
    @Published var habitName: String?
    @Published var habitIcon: String?
    @Published var reminders: [Reminder] = []
    @Published var notificationContent: String?
    @Published var motivation: Motivation?
    
    func postHabit() async {}
}
