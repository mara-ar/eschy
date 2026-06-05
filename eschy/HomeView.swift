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
    @State private var remindersLoaded: Bool = false
    
    @State private var habitModel: HabitModel = HabitModel()
    @State private var reminderModel: ReminderModel = ReminderModel()
    
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

                    }
                    
                    if habitsLoaded {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(habitModel.allHabitIds, id: \.self) { id in
                                    HabitCardView(habitId: id)
                                }
                            }
                            .padding(1)
                        }
                    } else {
                        LoadingView(spinnerColor: .primaryGreen)
                    }
                    
                    HStack {
                        Text("Today's Reminders")
                            .font(.outfit(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    if remindersLoaded {
                        ScrollView {
                            VStack {
                                ForEach(reminderModel.reminders) {reminder in
                                    ReminderCardView(reminder: reminder)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray3, lineWidth: 1)
                            )
                            .padding(1)
                        }
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
            await habitModel.fetchHabitIds()
            habitsLoaded = true
            await reminderModel.fetchReminders()
            remindersLoaded = true
        }
    }
}

#Preview {
    HomeView()
}
