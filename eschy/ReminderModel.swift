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
            let response = try? await supabase.from("reminders").select("id,user_id,habit_id,hour,minute,active,label").execute()
            
            let decoder = JSONDecoder()

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)

            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let reminders = try decoder.decode([Reminder].self, from: response!.data)
            print(response)
            print(reminders)
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
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case habitId = "habit_id"
        case hour
        case minute
        case active
        case label
    }
}
