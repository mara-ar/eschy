//
//  HabitModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/15/26.
//

import Foundation

struct HabitId: Decodable, Identifiable {
    let id: UUID
}

struct Habit: Hashable, Decodable, Identifiable, Equatable {
    let id: UUID
    let habit: String
    let icon: String
    let createdAt: Date
    let notificationContent: String
    let streak: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case habit
        case icon
        case createdAt = "created_at"
        case notificationContent = "notification_content"
        case streak = "streak_length"
    }
}

struct HabitSetup: Hashable, Decodable {
    var habit: String
    var icon: String
    var notificationContent: String
    var reminders: [ReminderData] = []
    var motivationConfig: MotivationConfig
    
    init() {
        self.habit = ""
        self.icon = ""
        self.notificationContent = ""
        self.motivationConfig = MotivationConfig()
    }
}

final class HabitDecoder {
    private let decoder = JSONDecoder()
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        decoder.dateDecodingStrategy = .formatted(formatter)
    }
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        try decoder.decode(type, from: data)
    }
}
