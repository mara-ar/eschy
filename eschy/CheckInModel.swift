//
//  CheckInModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/6/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor class CheckInModel: ObservableObject {
    func fetchLatestCheckInByHabitId(habitId: UUID) async -> CheckIn? {
        do {
            let response = try? await supabase
                .from("check_ins")
                .select()
                .eq("relapsed", value: true)
                .eq("habit_id", value: habitId)
                .order("created_at", ascending: false)
                .single()
                .execute()
            
//            if let data = response?.data {
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print(jsonString)
//                } else {
//                    print("Unable to convert data to a UTF-8 string.")
//                }
//            }
            
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = .iso8601
            
            let checkIn = try decoder.decode(CheckIn.self, from: response!.data)
            
            return checkIn
        } catch {
            print(error)
        }
        return nil
    }
}

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
