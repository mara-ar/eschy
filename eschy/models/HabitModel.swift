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
    
    enum CodingKeys: String, CodingKey {
        case id
        case habit
        case icon
        case createdAt = "created_at"
        case notificationContent = "notification_content"
    }
}
