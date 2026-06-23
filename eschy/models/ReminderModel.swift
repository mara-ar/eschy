//
//  ReminderModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/15/26.
//

import Foundation

struct Reminder: Decodable, Identifiable, Equatable {
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

struct ReminderData: Hashable, Decodable, Identifiable {
    var id: UUID = UUID()
    let hour: Int?
    let minute: Int?
    let label: String?
    var isOn: Bool = true
}

enum ReminderStatus {
    case completed
    case missed
    case upcoming
}
