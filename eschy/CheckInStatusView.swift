//
//  CheckInStatusView.swift
//  eschy
//
//  Created by Abhinav Mara on 5/23/26.
//

import SwiftUI

struct CheckInStatusView: View {
    let status: CheckInStatus
    
    var body: some View {
        if status == .success {
            Text("Stayed Strong")
                .font(.outfit(size: 12))
                .foregroundStyle(.green)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .fill(.green.opacity(0.1))
                )
        } else if (status == .relapse) {
            Text("Relapsed")
                .font(.outfit(size: 12))
                .foregroundStyle(.red)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .fill(.red.opacity(0.1))
                )
        } else if (status == .pending) {
            Text("Pending")
                .font(.outfit(size: 12))
                .foregroundStyle(.gray1)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .fill(.gray1.opacity(0.1))
                )
        }
    }
}

#Preview {
    CheckInStatusView(status: .pending)
}
