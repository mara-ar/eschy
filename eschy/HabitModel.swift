//
//  HabitModel.swift
//  eschy
//
//  Created by Abhinav Mara on 5/23/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor class HabitModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    func fetchHabits() async {
        do {
            let response = try? await supabase.from("habits").select("id,habit,icon,created_at,notification_content").execute()
            
            let decoder = JSONDecoder()

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)

            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let habits = try decoder.decode([Habit].self, from: response!.data)
            print(response)
            print(habits)
            self.habits = habits
        } catch {
            print(error)
        }
    }
}

struct Habit: Decodable, Identifiable {
    let id: UUID
    let habit: String
    let icon: String
    let createdAt: Date
    let notificationContent: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case habit
        case icon
        case createdAt = "created_at"
        case notificationContent = "notification_content"
    }
}

enum CheckInStatus: String, Codable {
    case success
    case relapse
    case pending
}
