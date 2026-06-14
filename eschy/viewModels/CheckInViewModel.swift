//
//  CheckInViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/15/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor class CheckInViewModel: ObservableObject {
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
            
            if let _ = response {
                let checkIn = try decoder.decode(CheckIn.self, from: response!.data)
                return checkIn
            }
            
            return nil
        } catch {
            print(error)
        }
        return nil
    }
}

