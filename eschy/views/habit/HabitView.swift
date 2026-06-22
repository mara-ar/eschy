//
//  HabitView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/22/26.
//

import SwiftUI

struct HabitView: View {
    let habitId: UUID
    var body: some View {
        Text("\(habitId)")
    }
}

#Preview {
    HabitView(habitId: UUID())
}
