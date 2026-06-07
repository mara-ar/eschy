//
//  MainView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/6/26.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var quickActionsState: QuickActionsState
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Group {
                if selectedIndex == 0 {
                    HomeView()
                    Color.black.opacity(quickActionsState.active ? 0.5 : 0)
                        .ignoresSafeArea()
                } else {
                    InsightsView()
                    Color.black.opacity(quickActionsState.active ? 0.5 : 0)
                        .ignoresSafeArea()
                }
                
                QuickActionsView()
                    .offset(y: quickActionsState.active ? (quickActionsState.loggingRelapse ? 0 : 300) : 800)
                    .zIndex(5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeInOut, value: quickActionsState.active)
            .animation(.easeInOut, value: quickActionsState.active)
            
            
            
            
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
                print("quick actions")
                quickActionsState.active = !quickActionsState.active
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: quickActionsState.active ? 45 : 0))
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
    }
}

#Preview {
    var appState = QuickActionsState()
    MainView()
        .environmentObject(appState)
}
