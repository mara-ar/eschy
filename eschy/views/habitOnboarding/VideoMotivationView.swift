//
//  VideoMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI

struct VideoMotivationView: View {
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
                ToolbarItem (placement: .topBarTrailing) {
                    Button {
                        print("create video motivation")
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

#Preview {
//    VideoMotivationView()
}
