//
//  ReminderModel.swift
//  eschy
//
//  Created by Abhinav Mara on 5/26/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor class ReminderModel: ObservableObject {
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

struct Reminder: Decodable, Identifiable {
    let id: UUID
    let userId: UUID
    let habitId: UUID
    let hour: Int
    let minute: Int
    let label: String
    let active: Bool
    let checkedIn: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case habitId = "habit_id"
        case hour
        case minute
        case active
        case label
        case checkedIn = "checked_in"
    }
}
