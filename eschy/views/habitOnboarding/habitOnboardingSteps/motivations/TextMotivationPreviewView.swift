//
//  TextMotivationPreviewView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/27/26.
//

import SwiftUI

struct TextMotivationPreviewView: View {
    @Binding var sheet: Bool
    let motivationalText: String
    
    var body: some View {
        VStack (alignment: .center) {
            VStack {
                Text("\(motivationalText)")
                    .font(.outfit(size: 24))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryGreen, ignoresSafeAreaEdges: .all)
        .overlay(alignment: .bottom) {
            Button {
                print("go back")
                sheet = false
            } label: {
                Text("End preview")
                    .font(.outfit(size: 14))
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .fill(.white)
                    )
                    .foregroundStyle(.black)
            }

        }
    }
}

#Preview {
//    TextMotivationPreviewView()
}
