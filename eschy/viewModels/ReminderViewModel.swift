//
//  ReminderViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/15/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    
    func fetchReminders() async {
        do {
            let response = try? await supabase.from("reminders").select().order("hour").execute()
            
            let decoder = JSONDecoder()

            let reminders = try decoder.decode([Reminder].self, from: response!.data)
            self.reminders = reminders
        } catch {
            print(error)
        }
    }
}

