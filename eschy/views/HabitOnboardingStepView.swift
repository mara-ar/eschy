//
//  HabitOnboardingStepView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/14/26.
//

import SwiftUI

struct HabitOnboardingStepView: View {
    @Binding var progress: Int
    var body: some View {
        switch progress {
        case 1:
            HabitOnboardingNameAndIcon()
        default:
            Text("Step: \(progress)")
        }
    }
}

#Preview {
    @Previewable @State var progress: Int = 1
    HabitOnboardingStepView(progress: $progress)
}
