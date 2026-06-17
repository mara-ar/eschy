//
//  HomeViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
import Supabase
internal import Combine

final class HomeViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    @Published var reminders: [Reminder] = []
    @Published var sortedReminderHabitPairs: [(Reminder, Habit)] = []
    
    private var mapHabitToReminders: [Habit: [Reminder]] {
        return [:]
    }
    
    func getAllHabits() async {
        do {
            let response = try? await supabase.from("habits").select().execute()
            
//            if let data = response?.data {
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print(jsonString)
//                } else {
//                    print("Unable to convert data to a UTF-8 string.")
//                }
//            }
            
            let decoder = JSONDecoder()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let habits = try decoder.decode([Habit].self, from: response!.data)
            self.habits = habits
        } catch {
            print(error)
        }
    }
    
    func getAllReminders() async {
        do {
            let response = try? await supabase.from("reminders").select().order("hour").execute()
            
            let decoder = JSONDecoder()

            let reminders = try decoder.decode([Reminder].self, from: response!.data)
            self.reminders = reminders
        } catch {
            print(error)
        }
    }
    
    func getSortedReminderHabitPairs() async {
        if self.habits == [] {
            await self.getAllHabits()
        }
        if self.reminders == [] {
            await self.getAllReminders()
        }
        
        var reminderHabitPairs: [(Reminder, Habit)] = []
        for h in self.habits {
            var associatedReminders = self.reminders.filter({$0.habitId == h.id})
            for r in associatedReminders {
                reminderHabitPairs.append((r, h))
            }
        }
        
        self.sortedReminderHabitPairs = reminderHabitPairs.sorted { a, b in
            return (a.0.hour, a.0.minute) < (b.0.hour, b.0.minute)
        }
    }
}
