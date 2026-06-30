//
//  ImageMotivationPreviewView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/29/26.
//

import SwiftUI

struct ImageMotivationPreviewView: View {
    @Binding var habitData: HabitSetup
    @Binding var sheet: ImageMotivationSheet?
    @State var img: Image? = nil
    
    var body: some View {
        VStack {
            if let img = img {
                img
                    .resizable()
                    .scaledToFit()
                    .position(habitData.motivationConfig.imagePosition ?? CGPoint(x: 0, y: 0))
                    .scaleEffect(habitData.motivationConfig.imageScale ?? 1)
            }
        }
        .overlay(alignment: .bottom, content: {
            Button {
                print("exit preview")
                sheet = nil
            } label: {
                Text("End Preview")
                    .font(.outfit(size: 14))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(.white)
                    )
            }
        })
        .task {
            if let imageData = habitData.motivationConfig.image {
                if let uiImage = UIImage(data: imageData) {
                    img = Image(uiImage: uiImage)
                } else {
                    print("could not create uiimage from image data")
                }
            } else {
                print("no image data")
            }
        }
    }
}

#Preview {
//    ImageMotivationPreviewView()
}
