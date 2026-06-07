//
//  MainView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/6/26.
//

import SwiftUI

struct MainView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedIndex: Int = 0
    @State private var showActionIcons: Bool = false
    @State private var activeSheet: ActiveSheet? = nil
    
    
    
    func resetActionIcons() {
        showActionIcons = false
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Group {
                if selectedIndex == 0 {
                    HomeView()
                        .blur(radius: showActionIcons ? 5 : 0)
                        .animation(.easeInOut, value: showActionIcons)
                } else {
                    InsightsView()
                        .blur(radius: showActionIcons ? 5 : 0)
                        .animation(.easeInOut, value: showActionIcons)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                Button(action: { selectedIndex = 0 }) {
                    VStack {
                        Image("home-smile")
                    }
                }
                .foregroundColor(selectedIndex == 0 ? .primaryGreen : .gray2)
                
                Spacer()
                
                Spacer()
                
                Button(action: { selectedIndex = 1 }) {
                    VStack {
                        Image("grid-01")
                    }
                }
                .foregroundColor(selectedIndex == 1 ? .primaryGreen : .gray2)
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 30)
            .background(Color(.white))
            .border(.gray3, width: 1)
            .zIndex(6)
            
            Button {
                // TODO: open sheet for stay strong view
                print("go to stay strong")
                activeSheet = .stayStrong
                showActionIcons = false
            } label: {
                VStack {
                    Image("stay-strong")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Circle()
                                .fill(.primaryGreen)
                        )
                        .shadow(color: .primaryGreen.opacity(0.5), radius: 8, y: 4)
                    Text("Resist urges")
                        .font(.outfit(size: 10))
                        .foregroundStyle(.primaryGreen)
                }
            }
            .offset(x: showActionIcons ? -75 : 0, y: showActionIcons ? -100 : -32)
            .opacity(showActionIcons ? 1 : 0)
            .animation(.spring(bounce: 0.25), value: showActionIcons)
            
            Button {
                // TODO: open sheet for logging relapse
                print("go to log relpase")
                activeSheet = .logRelapse
                showActionIcons = false
            } label: {
                VStack {
                    Image("log-relapse")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Circle()
                                .fill(.primaryGreen)
                        )
                        .shadow(color: .primaryGreen.opacity(0.5), radius: 8, y: 4)
                    Text("Log relapse")
                        .font(.outfit(size: 10))
                        .foregroundStyle(.primaryGreen)
                }
            }
            .offset(x: 0, y: showActionIcons ? -150 : -32)
            .opacity(showActionIcons ? 1 : 0)
            .animation(.spring(bounce: 0.25), value: showActionIcons)
            
            Button {
                // TODO: open sheet for habit onboarding
                print("go to habit onboarding")
                activeSheet = .createHabit
                showActionIcons = false
            } label: {
                VStack {
                    Image("file")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Circle()
                                .fill(.primaryGreen)
                        )
                        .shadow(color: .primaryGreen.opacity(0.5), radius: 8, y: 4)
                    Text("Create habit")
                        .font(.outfit(size: 10))
                        .foregroundStyle(.primaryGreen)
                }
            }
            .offset(x: showActionIcons ? 75 : 0, y: showActionIcons ? -100 : -32)
            .opacity(showActionIcons ? 1 : 0)
            .animation(.spring(bounce: 0.25), value: showActionIcons)
            
            Button {
                // TODO: quick actions
                print("quick actions")
                showActionIcons.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: showActionIcons ? 45 : 0))
                    .frame(width: 17.5)
                    .foregroundStyle(.white)
                    .padding(20)
                    .background(
                        Circle()
                            .fill(.primaryGreen)
                            .shadow(color: .heroButtonShadow.opacity(0.5), radius: 8.8, y: 8)
                    )
            }
            .offset(y: -32)
            .zIndex(7)
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(item: $activeSheet, onDismiss: resetActionIcons) { sheet in
            if sheet == .logRelapse {
                VStack {
                    LogRelapseView(activeSheet: $activeSheet)
                }
                .padding()
            } else if sheet == .stayStrong {
                VStack {
                    StayStrongView(activeSheet: $activeSheet)
                }
                .padding()
                .presentationDetents([.medium])
                .presentationBackground(.white)
                    
            }
        }
        .onTapGesture {
            if showActionIcons {
                showActionIcons = false
            }
        }
    }
}

enum ActiveSheet: Identifiable {
    case stayStrong, logRelapse, createHabit
    var id: String {
        switch self {
        case .stayStrong: return "Stay Strong"
        case .logRelapse: return "Log Relapse"
        case .createHabit: return "Create Habit"
        }
    }
}


#Preview {
    MainView()
}
