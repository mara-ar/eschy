//
//  ImageMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI

struct ImageMotivationView: View {
    @Binding var sheet: MotivationActiveSheet?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Image Motivation View")
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
                        print("create image motivation")
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

#Preview {
//    ImageMotivationView()
}
