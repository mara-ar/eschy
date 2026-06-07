//
//  Router.swift
//  eschy
//
//  Created by Abhinav Mara on 5/15/26.
//

import Foundation
import SwiftUI
internal import Combine

class Router: ObservableObject {
    @Published var path: [Route] = []
    
    func push(to route: Route) {
        path.append(route)
    }
    
    func pop() {
        _ = path.popLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func setPath(_ path: [Route]) {
        self.path = path
    }
}

enum Route: Hashable {
    case login
    case home
    case emailVerification(email: String)
    case register
    case main
    case insights
    case motivation(habitId: UUID)
    case habitOnboarding
}
