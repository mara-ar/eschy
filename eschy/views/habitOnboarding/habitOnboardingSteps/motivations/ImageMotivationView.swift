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
                    
                    Text("Upload a meaningful image")
                        .font(.outfit(size: 16))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        print("submit image-based motivation")
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
                
                VStack (spacing: 15) {
                    Button {
                        print("upload image")
                    } label: {
                        VStack (spacing: 10) {
                            Image("upload")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                            Text("Upload Image")
                                .font(.outfit(size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }
                        .padding(.vertical, 40)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, style: .init(lineWidth: 1, dash: [15, 10]))
                        )
                    }
                    .foregroundStyle(.black)
                    
                    Button {
                        print("go to editing mode")
                    } label: {
                        HStack (spacing: 5) {
                            Image("edit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.black)
                            Text("Edit")
                                .font(.outfit(size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    print("go to preview / editing mode")
                } label: {
                    Text("Preview")
                        .font(.outfit(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(.primaryGreen)
                }

            }
            .padding()
        }
    }
}

#Preview {
//    ImageMotivationView()
}
