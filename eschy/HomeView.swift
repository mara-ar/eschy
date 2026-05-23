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
    @State private var user: User? = nil
    @State private var avatarUrl: String = ""
    @State private var username: String = ""
    @State private var habitsLoaded: Bool = false
    
    @State private var habitModel: HabitModel = HabitModel()
    
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
                } else {
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
                    Text("\(username)")
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
                VStack {
                    HStack {
                        Text("Active Habits")
                            .font(.outfit(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                        Button {
                            // TODO: implement button
                            // view vs. dropdown
                            print("all habits")
                        } label: {
                            Text("View All")
                                .font(.outfit(size: 12))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                                .frame(width: 66, height: 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white)
                                        .stroke(.gray3, lineWidth: 1)
                                )
                        }

                    }
                    
                    if habitsLoaded {
                        ScrollView {
                            ForEach(habitModel.habits) {habit in
                                HabitCardView(habit: habit, streak: 5, mostRecentCheckInStatus: .success, nextReminder: "7:00 PM")
                            }
                        }
                    } else {
                        LoadingView(spinnerColor: .primaryGreen)
                    }
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try? await supabase.auth.signOut()
                        }
                    } label: {
                        Text("Log out")
                            .foregroundStyle(.white)
                            .font(.outfit(size: 17))
                            .fontWeight(.semibold)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(.primaryGreen)
                            )
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryGreen)
        .task {
            user = try? await supabase.auth.user()
            avatarUrl = "\(user?.userMetadata["avatar_url"], default: "")"
            username = "\(user?.userMetadata["display_name"], default: "")"
        }
        .task {
            await habitModel.fetchHabits()
            habitsLoaded = true
        }
    }
}

#Preview {
    HomeView()
}
