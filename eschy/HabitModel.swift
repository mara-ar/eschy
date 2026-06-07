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
    @Published var allHabits: [Habit] = []
    
    func fetchHabits() async {
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
            self.allHabits = habits
        } catch {
            print(error)
        }
    }
    
    func fetchHabitById(id: UUID) async -> Habit? {
        do {
            let response = try? await supabase.from("habits").select().eq("id", value: id).single().execute()
            
            let decoder = JSONDecoder()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let habit = try decoder.decode(Habit.self, from: response!.data)
            
            return habit
        } catch {
            print(error)
        }
        
        return nil
    }
}

struct HabitId: Decodable, Identifiable {
    let id: UUID
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
