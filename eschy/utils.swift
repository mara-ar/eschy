//
//  utils.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
import SwiftUI
import Supabase

func printResponse(response: Optional<PostgrestResponse<Any>>) {
    if let data = response?.data {
        if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Unable to convert data to a UTF-8 string.")
        }
    }
}

struct CustomSwitchToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Capsule()
                .fill(configuration.isOn ? .secondaryOrange : .gray2)
                .frame(width: 34, height: 20)
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(1)
                        .frame(width: 18, height: 18)
                        .shadow(radius: 1, x: 0, y: 1)
                        .offset(x: configuration.isOn ? 7.5 : -7.5)
                }
                .onTapGesture {
                    withAnimation(.spring) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}

extension ToggleStyle where Self == CustomSwitchToggleStyle {
    static var customSwitch: CustomSwitchToggleStyle {
        CustomSwitchToggleStyle()
    }
}

struct CustomWheelPicker<T: Hashable>: View {
    @Binding var selectedIndex: Int?
    let elements: [T]
    let dim: CGSize
    let fontSize: Font
    let fontWeight: Font.Weight
    
    var body: some View {
        ScrollView(.vertical) {
            VStack (spacing: 27.5) {
                ForEach(Array(elements.enumerated()), id: \.element) { index, element in
                    let indexDiff = index - (selectedIndex ?? 0)
                    Text("\(String(describing: element))")
                        .frame(width: dim.width, height: dim.height)
                        .opacity(getOpacityFromIndexDiff(indexDiff: indexDiff))
                        .scaleEffect(y: getScaleFromIndexDiff(indexDiff: indexDiff))
                        .font(indexDiff == 0 ? fontSize : .default)
                        .fontWeight(indexDiff == 0 ? fontWeight : .regular)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1)
                        .animation(.easeInOut, value: indexDiff)
                        .id(index)
                }
            }
            .scrollTargetLayout()
            .padding(.bottom, 25)
        }
        .scrollPosition(id: $selectedIndex)
        .safeAreaPadding(.vertical, 100)
        .scrollIndicators(.never)
        .frame(height: 250)
        .ignoresSafeArea()
        .scrollTargetBehavior(.viewAligned)
    }
}

@MainActor
func getScaleFromIndexDiff(indexDiff: Int) -> Double {
    if indexDiff == 0 {
        return 1
    }
    
    return 1.0 / (Double(abs(Double(indexDiff))) + 0.1)
}

@MainActor
func getOpacityFromIndexDiff(indexDiff: Int) -> Double {
    if indexDiff == 0 {
        return 1
    }
    
    let multiplier: Double = Double(abs(indexDiff) * 2)
    
    return 1.0 / (Double(abs(Double(indexDiff))) + multiplier)
}

struct MotivationCardAnimation: ViewModifier {
    @Binding var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .shadow(color: .gray3, radius: 10, y: 5)
            )
            .offset(y: isAnimating ? 0 : 15)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
    }
}

extension View {
    func motivationCardAnimation(isAnimating: Binding<Bool>) -> some View {
        self.modifier(MotivationCardAnimation(isAnimating: isAnimating))
    }
}
