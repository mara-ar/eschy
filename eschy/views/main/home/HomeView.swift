//
//  HomeView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/13/26.
//

import SwiftUI
import AuthenticationServices
import Supabase


struct HomeView: View {
    @State private var avatarUrl: String = ""
    @State private var username: String = ""
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            HStack (spacing: 11) {
                if avatarUrl != "" {
                    AsyncImage(url: URL(string: "\(avatarUrl, default: "")")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44)
                                .mask(Circle())
                        }
                        else {
                            LoadingView(spinnerColor: .white)
                        }
                    }
                .frame(width: 44, height: 44)
                }
                else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.white)
                }
                VStack (alignment: .leading) {
                    Text("Hello")
                        .font(.outfit(size: 12))
                        .foregroundStyle(.white)
                        .frame(alignment: .leading)
                    Text(verbatim: "\(username)")
                        .font(.outfit(size: 16))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .frame(alignment: .leading)
                }
                .frame(alignment: .leading)
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .frame(alignment: .leading)
            .frame(maxWidth: .infinity)
            // TODO: important information
            ZStack {
                if viewModel.habits.count > 0 && viewModel.sortedReminderHabitPairs.count > 0 {
                    ScrollView {
                        VStack (alignment: .leading) {
                            Text("Active Habits")
                                .font(.outfit(size: 16))
                                .fontWeight(.semibold)
                                .padding(.horizontal, 16)
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModel.habits, id: \.id) { habit in
                                        HabitCardView(habit: habit)
                                            .containerRelativeFrame(.horizontal, count: 3, spacing: 16)
                                            .scrollTransition { content, phase in
                                                content
                                                    .scaleEffect(
                                                        x: phase.isIdentity ? 1 : 0.8,
                                                        y: phase.isIdentity ? 1 : 0.8
                                                    )
                                                    .offset(
                                                        x: phase.value * -10,
                                                    )
                                            }
                                    }
                                }
                                .scrollTargetLayout()
                                //                            .padding(1)
                            }
                            .safeAreaPadding(.horizontal, 16)
                            .safeAreaPadding(.vertical, 1)
                            .contentMargins(0, for: .scrollContent)
                            .scrollIndicators(.hidden)
                            .scrollTargetBehavior(.viewAligned)
                            .frame(maxWidth: .infinity)
                            
                            Group {
                                Text("Today's Reminders")
                                    .font(.outfit(size: 16))
                                    .fontWeight(.semibold)
                                //                            ScrollView {
                                VStack {
                                    ForEach(viewModel.sortedReminderHabitPairs, id: \.0.id) {r, h in
                                        ReminderCardView(reminder: r, habit: h)
                                            .padding(.horizontal)
                                    }
                                }
                                .padding(.vertical)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.gray3, lineWidth: 1)
                                )
                                .padding(1)
                                //                            }
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                } else {
                    LoadingView(spinnerColor: .primaryGreen)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryGreen)
        .task {
            avatarUrl = "\(try? await supabase.auth.session.user.userMetadata["avatar_url"], default: "")"
            username = "\(try? await supabase.auth.session.user.userMetadata["display_name"], default: "")"
        }
        .task {
            await viewModel.getAllHabits()
            await viewModel.getAllReminders()
            await viewModel.getSortedReminderHabitPairs()
        }
    }
}

#Preview {
    HomeView()
}
