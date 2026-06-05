//
//  MainView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/6/26.
//

import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0
    @State private var active: Bool = false
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Group {
                if selectedIndex == 0 {
                    HomeView()
                } else {
                    InsightsView()
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
            
            Button {
                print("quick actions")
                active = !active
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: active ? 45 : 0))
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
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainView()
}
