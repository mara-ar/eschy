//
//  HabitOnboardingMotivationCardView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/30/26.
//

import SwiftUI

struct HabitOnboardingMotivationCardView: View {
    @Binding var habitData: HabitSetup
    @State private var isAnimating: Bool = false
    
    var body: some View {
        Text("Horizontal Card View for \(habitData.habit) motivation")
    }
}



#Preview {
//    HabitOnboardingMotivationCardView()
}
