//
//  StayStrongView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/8/26.
//

import SwiftUI

struct StayStrongView: View {
    @Binding var activeSheet: ActiveSheet?
    @EnvironmentObject private var router: Router
    @State private var selection: Habit? = nil
    @State private var isExpanded: Bool = false
    @State private var habitModel: HabitModel = HabitModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            VStack (alignment: .leading, spacing: 16) {
                Text("Stay Strong")
                    .font(.outfit(size: 16))
                    .fontWeight(.semibold)
                Text("Which habit are you struggling with?")
                    .font(.outfit(size: 12))
                    .foregroundStyle(.gray1)
            }
            
            VStack (alignment: .leading) {
                Text("Habit")
                    .font(.outfit(size: 12))
                    .foregroundStyle(.gray1)
                HStack {
                    if let selection = selection {
                        HStack (spacing: 5) {
                            Text("\(selection.habit)")
                                .font(.outfit(size: 16))
                            Circle()
                                .fill(.gray2)
                                .frame(width: 4, height: 4)
                            Text("\(selection.icon)")
                                .font(.outfit(size: 16))
                        }
                    } else {
                        Text("Select a habit")
                            .font(.outfit(size: 16))
                            .foregroundStyle(.gray2)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15)
                        .foregroundStyle(.black)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.snappy) {
                        isExpanded.toggle()
                    }
                }
                
                if isExpanded {
                    ScrollView {
                        ForEach(habitModel.allHabits, id: \.id) { habit in
                            HStack {
                                HStack (spacing: 5) {
                                    Text("\(habit.habit)")
                                        .font(.outfit(size: 14))
                                    Circle()
                                        .fill(.gray2)
                                        .frame(width: 4, height: 4)
                                    Text("\(habit.icon)")
                                        .font(.outfit(size: 14))
                                }
                                .font(.outfit(size: 16))
                                .fontWeight(selection == habit ? .regular : .light)
                                Spacer()
                                if selection == habit {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10)
                                        .foregroundStyle(.primaryGreen)
                                }
                            }
                            .contentShape(Rectangle())
                            .padding(.vertical, 1)
                            .onTapGesture {
                                selection = habit
                                withAnimation(.snappy.delay(0.5)) {
                                    isExpanded.toggle()
                                }
                            }
                        }
                    }
                    .transition(.move(edge: .bottom))
                    .contentMargins(0, for: .scrollContent)
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .stroke(.gray3, lineWidth: 1)
            )
            
            Spacer()
            
            Button {
                // TODO: go to motivation page
                print("go to motivation page")
                if let selection = selection {
                    router.push(to: .motivation(habitId: selection.id))
                    activeSheet = nil
                }
            } label: {
                Text("See your motivation")
                    .font(.outfit(size: 14))
                    .fontWeight(.semibold)
                    .padding(.vertical, 19)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        Capsule()
                            .fill(.primaryGreen)
                    )
            }

        }
        .padding()
        .task {
            await habitModel.fetchHabits()
        }
    }
}

#Preview {
//    StayStrongView()
}
