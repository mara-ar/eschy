//
//  ImageMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI
import PhotosUI

struct ImageMotivationView: View {
    @Binding var sheet: MotivationActiveSheet?
    @State private var photoPickerIsActive: Bool = false
    @State private var photoSelection: PhotosPickerItem?
    @State private var photoImage: Image?
    
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
                    PhotosPicker(
                        selection: $photoSelection,
                        matching: .images,
                        preferredItemEncoding: .current,
                        photoLibrary: .shared()
                    ) {
                        VStack (spacing: 10) {
                            if let photoImage {
                                photoImage
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Image("upload")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 36, height: 36)
                                Text("Upload Image")
                                    .font(.outfit(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding(.vertical, photoImage != nil ? 10 : 40)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, style: .init(lineWidth: 1, dash: [15, 10]))
                        )
                    }
                    .onChange(of: photoSelection) {
                        Task {
                            if let imageData = try? await photoSelection?.loadTransferable(type: Data.self) {
                                let uiImage = UIImage(data: imageData)
                                if let uiImage {
                                    photoImage = Image(uiImage: uiImage)
                                }
                            } else {
                                print("Failed to load image")
                            }
                        }
                    }
                    
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
        .sheet(isPresented: $photoPickerIsActive, onDismiss: {
            photoPickerIsActive = false
        }) {
            VStack {
                PhotosPicker(
                    selection: $photoSelection,
                    matching: .images,
                    preferredItemEncoding: .current,
                    photoLibrary: .shared()
                ) {
                    VStack {
                        Text("Select Photos")
                        if let photo = photoSelection {
                            Button {
                                print("\(photo)")
                            } label: {
                                Text("show photo info")
                            }
                            
                        }
                        if let image = photoImage {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250)
                        }
                    }
                }
                .onChange(of: photoSelection) {
                    Task {
                        if let imageData = try? await photoSelection?.loadTransferable(type: Data.self) {
                            let uiImage = UIImage(data: imageData)
                            if let uiImage {
                                photoImage = Image(uiImage: uiImage)
                            }
                        } else {
                            print("Failed to load image")
                        }
                    }
                }
            }
            .presentationDetents([.medium])
            .presentationBackground(.white)
        }
    }
}

#Preview {
//    ImageMotivationView()
}
