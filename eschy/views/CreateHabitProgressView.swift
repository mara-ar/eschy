//
//  CreateHabitProgressView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/14/26.
//

import SwiftUI

struct CreateHabitProgressView: View {
    @Binding var progress: Int
    
    var widthValue: CGFloat {
        let val = CGFloat(200 * (CGFloat(progress) / 5.0))
        return val
    }
    var body: some View {
        ZStack {
            Capsule()
                .fill(.white)
                .stroke(.gray3, lineWidth: 1)
                .frame(width: 200, height: 10)
            Capsule()
                .fill(.secondaryOrange)
                .frame(width: widthValue, height: 10)
                .frame(maxWidth: 200, alignment: .leading)
        }
        .shadow(color: .gray3, radius: 8, x: 1, y: 3)
    }
}

#Preview {
    @Previewable @State var progress: Int = 1
    CreateHabitProgressView(progress: $progress)
}
