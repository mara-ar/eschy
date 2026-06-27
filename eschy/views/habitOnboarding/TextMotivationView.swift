//
//  TextMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI

struct TextMotivationView: View {
    @Binding var sheet: MotivationActiveSheet?
    @State private var previewSheet: Bool = false
    @State private var motivationalText = ""
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 25) {
                HStack {
                    Button {
                        sheet = nil
                    } label: {
                        Image(systemName: "xmark")
                            .padding()
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .fill(.black)
                                    .shadow(radius: 2, y: 2)
                            )
                    }
                    
                    Spacer()
                    
                    Text("Write your motivation")
                        .font(.outfit(size: 16))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        print("submit text-based motivation")
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                Circle()
                                    .fill(.primaryGreen)
                                    .shadow(color: .primaryGreen, radius: 2, y: 2)
                            )
                    }
                }
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Enter motivational text")
                            .font(.outfit(size: 12))
                            .foregroundStyle(.gray1)
                        TextField("", text: $motivationalText, axis: .vertical)
                            .font(.outfit(size: 16))
                            .fontWeight(.medium)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(4)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray3, lineWidth: 1)
                    )
                }

//                Spacer()
                
                Button {
                    print("go to preview")
                    previewSheet = true
                } label: {
                    Text("Preview")
                        .font(.outfit(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(.primaryGreen)
                }

            }
            .padding()
        }
        .fullScreenCover(isPresented: $previewSheet) {
            TextMotivationPreviewView(sheet: $previewSheet, motivationalText: motivationalText)
        }
    }
}

#Preview {
//    TextMotivationView()
}
