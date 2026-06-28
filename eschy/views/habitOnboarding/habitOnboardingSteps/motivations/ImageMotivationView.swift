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
                Spacer()
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
                    Text("Upload a meaningful image")
                        .font(.outfit(size: 16))
                        .fontWeight(.semibold)
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
