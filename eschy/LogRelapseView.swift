//
//  LogRelapseView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/7/26.
//

import SwiftUI

struct LogRelapseView: View {
    @State private var selection: Habit? = nil
    @State private var entry: String = ""
    @State private var isExpanded: Bool = false
    @State private var habitModel: HabitModel = HabitModel()
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case dropdown, text
    }
    
    var mdhm: DateComponents {
        return Calendar(identifier: .gregorian).dateComponents([.month, .day, .hour, .minute], from: Date())
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Text("Log Relapse")
                    .font(.outfit(size: 16))
                    .fontWeight(.semibold)
                Spacer()
            }
            if let month = mdhm.month, let day = mdhm.day, let hour = mdhm.hour, let minute = mdhm.minute {
                HStack (spacing: 8) {
                    HStack (spacing: 6) {
                        Image("calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                            .foregroundStyle(.black)
                        Text("Today \(day) \(convertIntToMonth(month: month))")
                    }
                    Circle()
                        .fill(Color.gray2)
                        .frame(width: 4, height: 4)
                    HStack (spacing: 6) {
                        Image("clock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                            .foregroundStyle(.black)
                        Text("\(hour):\(minute < 10 ? "0" : "")\(minute)")
                    }
                }
                .font(.outfit(size: 14))
                .padding(10)
                .background(
                    Capsule()
                        .fill(.gray3)
                )
            }
            
            VStack {
                HStack {
                    Text("Select")
                        .font(.outfit(size: 16))
                        .foregroundStyle(.gray2)
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
                    VStack {
                        ForEach(habitModel.allHabits, id: \.id) { habit in
                            HStack {
                                Text("\(habit.icon) \(habit.habit)")
                                    .font(.outfit(size: 16))
                                Spacer()
                                Image("checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                            }
                        }
                    }
                }
            }
            .focused($focusedField, equals: .dropdown)
            
            VStack (alignment: .leading) {
                Text("What happened")
                    .font(.outfit(size: 12))
                    .foregroundStyle(.gray1)
                TextField("Journal your experience here...", text: $entry, axis: .vertical)
                    .font(.outfit(size: 16))
                    .focused($focusedField, equals: .text)
                    .frame(alignment: .topLeading)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray3, lineWidth: 1)
            )
            Spacer()
        }
        .padding()
        .onTapGesture {
            focusedField = nil
        }
        .task {
            await habitModel.fetchHabits()
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    focusedField = nil
                } label: {
                    Text("Done")
                        .font(.outfit(size: 16))
                        .fontWeight(.medium)
                        .foregroundStyle(.primaryGreen)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .sharedBackgroundVisibility(.hidden)
        }
        .frame(maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .stroke(.gray3, lineWidth: 1)
        )
    }
}

func convertIntToMonth(month: Int) -> String {
    let month = DateFormatter().monthSymbols[month - 1]
    let start = month.index(month.startIndex, offsetBy: 0)
    let end = month.index(month.startIndex, offsetBy: 3)
    let monthName = month[start..<end]
    return String(monthName)
}

struct ClearToolbarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.blue) // Set your custom text color
            .opacity(configuration.isPressed ? 0.5 : 1.0) // Maintain standard tap behavior
    }
}

#Preview {
    LogRelapseView()
}
