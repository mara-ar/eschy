//
//  LogRelapseViewModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
internal import Combine

final class LogRelapseViewModel: ObservableObject {
    @Published var relapsedHabit: Habit?
    @Published var journalEntry: String?
    
    func logRelapse() {}
}
