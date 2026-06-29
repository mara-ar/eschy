//
//  ImageMotivationEditView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/29/26.
//

import SwiftUI

struct ImageMotivationEditView: View {
    @Binding var sheet: ImageMotivationSheet?
    let img: Image
    @State private var position: CGPoint = CGPoint(x: 0, y: 0)
    @State private var movingOffset: CGSize = CGSize(width: 0, height: 0)
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                position.x += value.translation.width - movingOffset.width
                position.y += value.translation.height - movingOffset.height
                
                movingOffset = value.translation
            }
            .onEnded { value in
                movingOffset = CGSize(width: 0, height: 0)
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(position)
                    .gesture(drag)
            }
            .onAppear(perform: {
                position.x = geometry.size.width / 2
                position.y = geometry.size.height / 2
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HStack {
                    Button {
                        print("dismiss and go back")
                        sheet = nil
                    } label: {
                        Image(systemName: "xmark")
                            .padding()
                            .foregroundStyle(.black)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .shadow(color: .gray3.opacity(0.5), radius: 5)
                            )
                    }
                    
                    Spacer()
                    
                    Button {
                        print("save and go back")
                        sheet = nil
                    } label: {
                        Image(systemName: "checkmark")
                            .padding()
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .fill(.primaryGreen)
                                    .shadow(color: .primaryGreen.opacity(0.5), radius: 5)
                            )
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
//    ImageMotivationEditView()
}
