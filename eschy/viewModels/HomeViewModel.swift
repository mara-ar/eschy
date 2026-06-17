//
//  HomeViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
internal import Combine

final class HomeViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    @Published var reminders: [Reminder] = []
    
    private var mapHabitToReminders: [Habit: [Reminder]] {
        return [:]
    }
    
    func getAllHabits() async {}
    
    func getAllReminders() async {}
}
