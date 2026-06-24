//
//  HabitOnboardingNotificationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/24/26.
//

import SwiftUI

struct HabitOnboardingNotificationView: View {
    @Binding var habitData: HabitSetup
    @State private var localNotificationContent: String = ""
    var body: some View {
        VStack (spacing: 20) {
            Text("What should the notification say?")
                .font(.outfit(size: 20))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack (spacing: 16) {
                HStack {
                    Image("bell-02")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(
                            Circle()
                                .fill(.gray3.opacity(0.5))
                        )
                    
                    VStack (alignment: .leading) {
                        Text("\(String(habitData.habit))")
                            .font(.outfit(size: 14))
                            .fontWeight(.medium)
                        Text("\(habitData.notificationContent)")
                            .font(.outfit(size: 12))
                            .foregroundStyle(.gray1)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                )
                .padding(.vertical, 20)
                .padding(.leading, 49)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.secondaryOrange)
                )
            }
        }
    }
}

//#Preview {
//    @Previewable @State var habitData = HabitSetup()
//    HabitOnboardingNotificationView(habitData: $habitData)
//}
