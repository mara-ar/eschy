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
                            .foregroundStyle(.black)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .shadow(color: .gray3.opacity(0.5), radius: 5, y: 0)
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
                                    .shadow(color: .primaryGreen.opacity(0.5), radius: 5, y: 0)
                            )
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("Enter motivational text")
                        .font(.outfit(size: 12))
                        .foregroundStyle(.gray1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("", text: $motivationalText, axis: .vertical)
                        .font(.outfit(size: 16))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )

                Spacer()
                
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
