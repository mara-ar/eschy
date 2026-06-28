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
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(habitData.notificationContent)")
                            .font(.outfit(size: 12))
                            .foregroundStyle(.gray1)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                )
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.secondaryOrange)
                )
                
                VStack (alignment: .leading) {
                    Text("Enter Notification Text")
                        .font(.outfit(size: 12))
                        .foregroundStyle(.gray1)
                    TextField("", text: $habitData.notificationContent, axis: .vertical)
                        .font(.outfit(size: 16))
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(10)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )
                
                VStack (alignment: .leading, spacing: 5) {
                    Text("Suggestion")
                        .font(.outfit(size: 14))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack (spacing: 5) {
                        Circle()
                            .fill(.gray1)
                            .frame(width: 3, height: 3)
                        Text("\"Pause. You're in control.\"")
                            .font(.outfit(size: 12))
                            .foregroundStyle(.gray1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

//#Preview {
//    @Previewable @State var habitData = HabitSetup()
//    HabitOnboardingNotificationView(habitData: $habitData)
//}
