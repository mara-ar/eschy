//
//  QuickActionsView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/7/26.
//

import SwiftUI

struct QuickActionsView: View {
    var body: some View {
        VStack {
            QuickCheckInView()
            Divider()
            QuickCreateHabitView()
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .stroke(.gray3, lineWidth: 1)
        )
    }
}

#Preview {
    QuickActionsView()
}
