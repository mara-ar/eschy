//
//  HabitViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/15/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor class HabitViewModel: ObservableObject {
    @Published var allHabits: [Habit] = []
    
    func fetchHabits() async {
        do {
            let response = try? await supabase.from("habits").select().execute()
            
            let decoder = HabitDecoder()
            
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



