//
//  HabitOnboardingNameAndIcon.swift
//  eschy
//
//  Created by Abhinav Mara on 6/14/26.
//

import SwiftUI
import EmojiKit

struct HabitOnboardingNameAndIcon: View {
    @State private var habitName: String = ""
    @State private var emojiPickerIsActive: Bool = false
    
    @FocusState var isFocusedOnHabitName
    @FocusState var isFocusedOnEmojiPicker
    @State private var query = ""
    
    @State private var selectionValue: Emoji.GridSelection? = .init()
    @State private var category: EmojiCategory?
    private var categoryBinding: Binding<EmojiCategory?> { $category }
    private var selectionBinding: Binding<Emoji.GridSelection?> { $selectionValue }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("What habit do you want to break?")
                .font(.outfit(size: 20))
                .fontWeight(.semibold)
            VStack (spacing: 16) {
                VStack (alignment: .leading) {
                    Text("Enter Habit Name")
                        .font(.outfit(size: 12))
                        .foregroundStyle(.gray1)
                    TextField("", text: $habitName)
                        .font(.outfit(size: 16))
                        .fontWeight(.medium)
                        .focused($isFocusedOnHabitName)
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )
                VStack {
                    HStack (spacing: 15) {
                        Button {
                            emojiPickerIsActive.toggle()
                        } label: {
                            Text("\(selectionValue?.emoji?.char ?? "🙅‍♂️")")
                                .font(.outfit(size: 36))
                                .padding()
                                .background(
                                    Circle()
                                        .stroke(.gray3, lineWidth: 1)
                                        .shadow(color: .gray3, radius: 1, x: 1, y: 3)
                                )
                        }
//                        Spacer()
//                        Button {
//                            withAnimation(.easeInOut) {
//                                emojiPickerIsActive.toggle()
//                            }
//                            isFocusedOnHabitName = false
//                        } label: {
//                            Image(systemName: "chevron.down")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 15)
//                                .rotationEffect(.degrees(emojiPickerIsActive ? 180 : 0))
//                                .foregroundStyle(.black)
//                        }
//                        .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
//                    if emojiPickerIsActive {
//                        EmojiGridScrollView(
//                            axis: .vertical,
//                            category: categoryBinding,
//                            selection: selectionBinding,
//                            query: query,
//                            action: { emoji in
//                                withAnimation(.easeInOut) {
//                                    emojiPickerIsActive.toggle()
//                                }
//                            },
//                            sectionTitle: { $0.view },
//                            gridItem: { $0.view }
//                        )
//                        .tint(.primaryGreen)
//                        .navigationTitle("EmojiKit")
//                        .searchable(text: $query, placement: .navigationBarDrawer)
//                        .transition(.move(edge: .bottom))
//                        .emojiGridStyle(.standard)
//                    }
                }
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//                .padding(.vertical)
//                .background(
//                    RoundedRectangle(cornerRadius: 12)
//                        .fill(.white)
//                        .stroke(.gray3, lineWidth: 1)
//                )
            }
            
//            Spacer()
        }
        .sheet(isPresented: $emojiPickerIsActive, onDismiss: {
            query = ""
        }, content: {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        emojiPickerIsActive.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14)
                            .padding()
                    }
                    .foregroundStyle(.black)
                }
                .overlay (alignment: .center) {
                    Text("Select an emoji")
                        .font(.outfit(size: 17))
                        .fontWeight(.medium)
                }
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray3)
                    TextField("Search", text: $query)
                        .font(.outfit(size: 17))
                }
                .padding()
                .background(
                    Capsule()
                        .stroke(.gray3, lineWidth: 1)
                )
                    
                EmojiGridScrollView(
                    axis: .vertical,
                    category: categoryBinding,
                    selection: selectionBinding,
                    query: query,
                    action: { emoji in
                        emojiPickerIsActive.toggle()
                    },
                    sectionTitle: { $0.view },
                    gridItem: { $0.view }
                )
                .tint(.primaryGreen)
                .navigationTitle("EmojiKit")
//                .transition(.move(edge: .bottom))
                .emojiGridStyle(.standard)
            }
            .padding()
        })
    }
}

#Preview {
    HabitOnboardingNameAndIcon()
}
