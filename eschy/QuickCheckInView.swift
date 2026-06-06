//
//  QuickCheckInView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/7/26.
//

import SwiftUI

struct QuickCheckInView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Quick Check In")
                .font(.outfit(size: 16))
                .fontWeight(.semibold)
            VStack (spacing: 12) {
                Button {
                    // TODO: log relapse
                    print("log relapse action")
                } label: {
                    HStack {
                        VStack (alignment: .leading, spacing: 12) {
                            Text("Log Relapse")
                                .font(.outfit(size: 14))
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                            Text("Be honest and reset your streak")
                                .font(.outfit(size: 12))
                                .fontWeight(.regular)
                                .foregroundStyle(.gray1)
                        }
                        
                        Spacer()
                        
                        Image("log-relapse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32)
                            .foregroundStyle(.black)
                    }
                    .padding(18)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray3, lineWidth: 1)
                    )
                }

                
                
                Button {
                    // TODO: redirect to motivation
                    print("stay strong action")
                } label: {
                    HStack {
                        VStack (alignment: .leading, spacing: 12) {
                            Text("Stay Strong")
                                .font(.outfit(size: 14))
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                            Text("Pause the urge and stay in control")
                                .font(.outfit(size: 12))
                                .fontWeight(.regular)
                                .foregroundStyle(.gray1)
                        }
                        
                        Spacer()
                        
                        Image("stay-strong")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36)
                            .foregroundStyle(.black)
                    }
                    .padding(18)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray3, lineWidth: 1)
                    )
                }
            }
        }
        .padding()
    }
}

#Preview {
    QuickCheckInView()
}
