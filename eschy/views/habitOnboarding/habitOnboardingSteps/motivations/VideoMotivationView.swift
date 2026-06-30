//
//  VideoMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI

struct VideoMotivationView: View {
    @Binding var habitData: HabitSetup
    @Binding var sheet: MotivationActiveSheet?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Video Motivation View")
            }
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Button {
                        sheet = nil
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
                
                ToolbarItem(placement: .principal) {
                    Text("Upload a meaningful video")
                        .font(.outfit(size: 16))
                        .fontWeight(.semibold)
                }
                
                ToolbarItem (placement: .topBarTrailing) {
                    Button {
                        print("create video motivation")
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .onAppear {
            habitData.motivationConfig.type = .video
        }
    }
}

#Preview {
//    VideoMotivationView()
}
