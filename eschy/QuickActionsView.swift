//
//  QuickActionsView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/7/26.
//

import SwiftUI

struct QuickActionsView: View {
    @EnvironmentObject var quickActionsState: QuickActionsState
    var body: some View {
        Group {
            if !quickActionsState.loggingRelapse {
                VStack {
                    QuickCheckInView()
                    Divider()
                    QuickCreateHabitView()
                    Spacer()
                }
            } else {
                LogRelapseView()
            }
        }
        .frame(maxHeight: .infinity)
        .animation(.easeInOut, value: quickActionsState.active)
        .animation(.easeInOut, value: quickActionsState.loggingRelapse)
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
