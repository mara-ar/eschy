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
    @State private var scaleValue: CGFloat = 1
    @State private var scaleBase: CGFloat = 1
    
    var scale: some Gesture {
        MagnifyGesture()
            .onChanged { value in
                if value.magnification < 1 {
                    scaleValue = max(0, scaleBase + value.magnification - 1)
                } else if value.magnification > 1 {
//                    scaleValue = min(5, scaleBase + value.magnification - 1)
                    scaleValue = scaleBase + value.magnification - 1
                }
            }
            .onEnded { value in
                scaleBase = scaleValue
            }
    }
    
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
                    .scaleEffect(scaleValue)
                    .gesture(drag)
                    .gesture(scale)
            }
            .onAppear(perform: {
                position.x = geometry.size.width / 2
                position.y = geometry.size.height / 2
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom, content: {
                Button {
                    print("reset")
                    scaleBase = 1
                    scaleValue = 1
                    position.x = geometry.size.width / 2
                    position.y = geometry.size.height / 2
                    movingOffset = CGSize(width: 0, height: 0)
                } label: {
                    Text("Reset")
                        .font(.outfit(size: 14))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundStyle(.black)
                        .background(
                            Capsule()
                                .fill(.white)
                        )
                }

            })
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
