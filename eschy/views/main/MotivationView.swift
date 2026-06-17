//
//  MotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/8/26.
//

import SwiftUI

struct MotivationView: View {
    let habitId: UUID
    var body: some View {
        Text("\(habitId)")
    }
}

#Preview {
    MotivationView(habitId: UUID(uuidString:"2f7ba747-cebd-4c59-9953-bbd9fb02a159") ?? UUID())
}
