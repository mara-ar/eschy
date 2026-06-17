//
//  CheckInModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/15/26.
//

import Foundation

struct CheckIn: Decodable, Identifiable {
    let id: UUID
    let userId: UUID
    let habitId: UUID
    let reminderId: UUID?
    let relapsed: Bool
    let content: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case habitId = "habit_id"
        case reminderId = "reminder_id"
        case relapsed
        case content
        case createdAt = "created_at"
    }
}

final class CheckInDecoder {
    private let decoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        try decoder.decode(type, from: data)
    }
}
