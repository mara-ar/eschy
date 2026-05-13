//
//  EmailConfirmationView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/13/26.
//

import SwiftUI

struct EmailConfirmationView: View {
    var email: String
    
    @State private var char1: String = ""
    @State private var char2: String = ""
    @State private var char3: String = ""
    @State private var char4: String = ""
    @State private var char5: String = ""
    @State private var char6: String = ""
    
    @State private var deletePressed: Bool = false
    
    enum Field: Hashable {
        case char1
        case char2
        case char3
        case char4
        case char5
        case char6
    }
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack (spacing: 30) {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(.primaryGreen)
            VStack {
                Text("Enter the passcode sent to ")
                    .font(.outfit(size: 16))
                    .multilineTextAlignment(.center)
                Text("\(email)")
                    .font(Font.outfit(size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.primaryGreen)
                    .multilineTextAlignment(.center)
                
                HStack {
                    TextField("", text: $char1)
                        .focused($focusedField, equals: .char1)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .frame(width: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .onChange(of: focusedField, { oldValue, newValue in
                            if newValue == .char1 {
                                if deletePressed {
                                    char1 = ""
                                    deletePressed = false
                                }
                            }
                        })
                        .onKeyPress(keys: [.delete], action: { press in
                            print("delete pressed")
                            char1 = ""
                            return .handled
                        })
                        .onKeyPress(characters: .decimalDigits, phases: .down) { press in
                            print("key pressed: \(press.characters)")
                            char1 = press.characters
                            focusedField = .char2
                            return .handled
                        }
                        .keyboardType(.numberPad)
                    TextField("", text: $char2)
                        .focused($focusedField, equals: .char2)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .frame(width: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .onChange(of: focusedField, { oldValue, newValue in
                            if newValue == .char2 {
                                if deletePressed {
                                    char2 = ""
                                    deletePressed = false
                                }
                            }
                        })
                        .onKeyPress(keys: [.delete], action: { press in
                            print("delete pressed")
                            deletePressed = true
                            focusedField = .char1
                            return .handled
                        })
                        .onKeyPress(characters: .decimalDigits, phases: .down) { press in
                            print("key pressed: \(press.characters)")
                            char2 = press.characters
                            focusedField = .char3
                            return .handled
                        }
                        .keyboardType(.numberPad)
                    TextField("", text: $char3)
                        .focused($focusedField, equals: .char3)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .frame(width: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .onChange(of: focusedField, { oldValue, newValue in
                            if newValue == .char3 {
                                if deletePressed {
                                    char3 = ""
                                    deletePressed = false
                                }
                            }
                        })
                        .onKeyPress(keys: [.delete], action: { press in
                            print("delete pressed")
                            deletePressed = true
                            focusedField = .char2
                            return .handled
                        })
                        .onKeyPress(characters: .decimalDigits, phases: .down) { press in
                            print("key pressed: \(press.characters)")
                            char3 = press.characters
                            focusedField = .char4
                            return .handled
                        }
                        .keyboardType(.numberPad)
                    TextField("", text: $char4)
                        .focused($focusedField, equals: .char4)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .frame(width: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .onChange(of: focusedField, { oldValue, newValue in
                            if newValue == .char4 {
                                if deletePressed {
                                    char4 = ""
                                    deletePressed = false
                                }
                            }
                        })
                        .onKeyPress(keys: [.delete], action: { press in
                            print("delete pressed")
                            deletePressed = true
                            focusedField = .char3
                            return .handled
                        })
                        .onKeyPress(characters: .decimalDigits, phases: .down) { press in
                            print("key pressed: \(press.characters)")
                            char4 = press.characters
                            focusedField = .char5
                            return .handled
                        }
                        .keyboardType(.numberPad)
                    TextField("", text: $char5)
                        .focused($focusedField, equals: .char5)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .frame(width: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .onChange(of: focusedField, { oldValue, newValue in
                            if newValue == .char5 {
                                if deletePressed {
                                    char5 = ""
                                    deletePressed = false
                                }
                            }
                        })
                        .onKeyPress(keys: [.delete], action: { press in
                            print("delete pressed")
                            deletePressed = true
                            focusedField = .char4
                            return .handled
                        })
                        .onKeyPress(characters: .decimalDigits, phases: .down) { press in
                            print("key pressed: \(press.characters)")
                            char5 = press.characters
                            focusedField = .char6
                            return .handled
                        }
                        .keyboardType(.numberPad)
                    TextField("", text: $char6)
                        .focused($focusedField, equals: .char6)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                        .frame(width: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .onKeyPress(keys: [.delete], action: { press in
                            print("delete pressed")
                            if char6 == "" {
                                deletePressed = true
                                focusedField = .char5
                            } else {
                                char6 = ""
                            }
                            return .handled
                        })
                        .onKeyPress(characters: .decimalDigits, phases: .down) { press in
                            print("key pressed: \(press.characters)")
                            char6 = press.characters
                            // TODO: verify passcode
                            print("code: \(char1+char2+char3+char4+char5+char6)")
                            return .handled
                        }
                        .keyboardType(.numberPad)
                }
            }
        }
    }
}

#Preview {
    EmailConfirmationView(email: "abhinavmara02@gmail.com")
}
