//
//  QuickActionsState.swift
//  eschy
//
//  Created by Abhinav Mara on 6/7/26.
//

import Foundation
internal import Combine

class QuickActionsState: ObservableObject {
    @Published var active: Bool = false
    @Published var loggingRelapse: Bool = false
}
