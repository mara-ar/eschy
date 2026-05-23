//
//  HomeView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/13/26.
//

import SwiftUI
import AuthenticationServices
import Supabase

struct HabitResponse: Decodable {
    let id: UUID
    let habit: String
    let relapses: String
    let icon: String
    let createdAt: Date
    let notificationContent: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case habit
        case relapses
        case icon
        case createdAt = "created_at"
        case notificationContent = "notification_content"
    }
}

struct HomeView: View {
    @State private var user: User? = nil
    @State private var avatarUrl: String = ""
    @State private var username: String = ""
    
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
            do {
                let response = try? await supabase.from("habits").select("id,habit,relapses,icon,created_at,notification_content").execute()
                
                let decoder = JSONDecoder()

                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.timeZone = TimeZone(secondsFromGMT: 0)

                decoder.dateDecodingStrategy = .formatted(formatter)
                
                let habits = try decoder.decode([HabitResponse].self, from: response!.data)
                print(response)
                print(habits)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    HomeView()
}
