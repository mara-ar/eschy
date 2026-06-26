//
//  TextMotivationView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/26/26.
//

import SwiftUI

struct TextMotivationView: View {
    @Binding var sheet: MotivationActiveSheet?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Text Motivation View")
            }
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Button {
                        sheet = nil
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
                ToolbarItem (placement: .topBarTrailing) {
                    Button {
                        print("create text motivation")
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

#Preview {
//    TextMotivationView()
}
