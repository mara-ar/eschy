//
//  TimePickerView.swift
//  eschy
//
//  Created by Abhinav Mara on 6/23/26.
//

import SwiftUI

struct TimePickerView: View {
    @Binding var hourSelection: Int?
    @Binding var minuteSelection: Int?
    @Binding var middayPeriodSelection: Int?
    let hours: [String]
    let minutes: [String]
    let middayPeriods: [String]
    
    var body: some View {
        HStack (spacing: 20) {
            VStack {
                CustomWheelPicker(selectedIndex: $hourSelection, elements: hours, dim: CGSize(width: 50, height: 25), fontSize: .title2, fontWeight: .semibold)
            }
            
            VStack {
                CustomWheelPicker(selectedIndex: $minuteSelection, elements: minutes, dim: CGSize(width: 50, height: 25), fontSize: .title2, fontWeight: .semibold)
            }
            
            VStack {
                CustomWheelPicker(selectedIndex: $middayPeriodSelection, elements: middayPeriods, dim: CGSize(width: 50, height: 25), fontSize: .title2, fontWeight: .semibold)
            }
        }
    }
}

#Preview {
    @Previewable @State var hourSelection: Int? = 0
    @Previewable @State var minuteSelection: Int? = 0
    @Previewable @State var middayPeriodSelection: Int? = 0
    
    var hours: [String] {
        let hours = Array(1...12).map { m in
            if m < 10 {
                return "0\(m)"
            }
            return "\(m)"
        }
        return hours
    }
    
    var minutes: [String] {
        let minutes = Array(0...60).map { m in
            if m < 10 {
                return "0\(m)"
            }
            return "\(m)"
        }
        return minutes
    }
    
    var middayPeriods: [String] {
        return ["AM", "PM"]
    }
    
    TimePickerView(hourSelection: $hourSelection, minuteSelection: $minuteSelection, middayPeriodSelection: $middayPeriodSelection, hours: hours, minutes: minutes, middayPeriods: middayPeriods)
}
