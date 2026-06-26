//
//  HabitOnboardingMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI

struct HabitOnboardingMotivationView: View {
    @Binding var habitData: HabitSetup
    @State var motivationActiveSheet: MotivationActiveSheet? = nil
    
    func onDismissMotivationSetup() {
        motivationActiveSheet = nil
    }
    
    var body: some View {
        VStack (spacing: 20) {
            Text("What should you see when you open it?")
                .font(.outfit(size: 20))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack (spacing: 12) {
                MotivationOptionView(sheet: $motivationActiveSheet, name: "Text", description: "A personal reminder", icon: Image("message-circle"), sheetToActivate: .text)
                MotivationOptionView(sheet: $motivationActiveSheet, name: "Image", description: "Something meaningful", icon: Image("image"), sheetToActivate: .image)
                MotivationOptionView(sheet: $motivationActiveSheet, name: "Video", description: "A message to yourself", icon: Image("camera"), sheetToActivate: .video)
            }
        }
        .sheet(item: $motivationActiveSheet, onDismiss: onDismissMotivationSetup) { motivationOption in
            switch motivationOption {
            case .text:
                TextMotivationView()
            case .image:
                ImageMotivationView()
            case .video:
                VideoMotivationView()
            }
        }
    }
}

struct MotivationOptionView: View {
    @Binding var sheet: MotivationActiveSheet?
    let name: String
    let description: String
    let icon: Image
    let sheetToActivate: MotivationActiveSheet
    
    var body: some View {
        Button {
            switch sheetToActivate {
            case .text:
                sheet = .text
            case .image:
                sheet = .image
            case .video:
                sheet = .video
            }
        } label: {
            HStack {
                VStack (spacing: 6) {
                    Text("\(name)")
                        .font(.outfit(size: 14))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(description)")
                        .font(.outfit(size: 12))
                        .foregroundStyle(.gray1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray3, lineWidth: 1)
            )
        }
        .foregroundStyle(.black)
    }
}

enum MotivationActiveSheet: Identifiable {
    case text, image, video
    var id: String {
        switch self {
        case .text: return "text"
        case .image: return "image"
        case .video: return "video"
        }
    }
}

#Preview {
    @Previewable @State var habitData: HabitSetup = HabitSetup()
    HabitOnboardingMotivationView(habitData: $habitData)
}
