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
    
    @FocusState var isFocused
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
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray3, lineWidth: 1)
                )
                VStack {
                    HStack (spacing: 15) {
                        Spacer()
                        Button {
                            withAnimation(.easeInOut) {
                                emojiPickerIsActive.toggle()
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .rotationEffect(.degrees(emojiPickerIsActive ? 180 : 0))
                                .foregroundStyle(.black)
                        }
                        .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .overlay (alignment: .center) {
                        Text("\(selectionValue?.emoji?.char ?? "🙅‍♂️")")
                            .font(.outfit(size: 36))
                    }
                    
                    if emojiPickerIsActive {
                        TextField("Search", text: $query)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(.white)
                                    .stroke(.gray3, lineWidth: 1)
                            )
                            .padding()
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        EmojiGridScrollView(
                            axis: .vertical,
                            category: categoryBinding,
                            selection: selectionBinding,
                            query: query,
                            action: { emoji in
                                withAnimation(.easeInOut) {
                                    emojiPickerIsActive.toggle()
                                }
                            },
                            sectionTitle: { $0.view },
                            gridItem: { $0.view }
                        )
                        .tint(.primaryGreen)
                        .navigationTitle("EmojiKit")
                        .searchable(text: $query, placement: .navigationBarDrawer)
                        .transition(.move(edge: .bottom))
                        .toolbar {
                            ToolbarItem {
                                Text("Hello")
                            }
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .stroke(.gray3, lineWidth: 1)
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    HabitOnboardingNameAndIcon()
}
