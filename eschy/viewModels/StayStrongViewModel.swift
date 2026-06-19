//
//  StayStrongViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/19/26.
//

import Foundation
import Supabase
internal import Combine

@MainActor
final class StayStrongViewModel: ObservableObject {
    @Published var habits: [Habit]?
    
    func getAllHabits() async {
        do {
            let response = try await supabase.from("habits").select().execute()
            
            let decoder = HabitDecoder()
            
            let habits = try decoder.decode([Habit].self, from: response.data)
            self.habits = habits
        } catch {
            print(error)
        }
    }
}
