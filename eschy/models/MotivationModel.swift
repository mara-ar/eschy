//
//  MotivationModel.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
import UIKit
import SwiftUI

struct Motivation {}

struct MotivationConfig: Decodable, Equatable, Hashable {
    var type: MotivationType?
    var textContent: String?
    var image: Data?
    var imagePosition: CGPoint?
    var imageScale: CGFloat?
    
    init(type: MotivationType, textContent: String? = nil, image: Data? = nil, imagePosition: CGPoint? = nil, imageScale: CGFloat? = nil) {
        self.type = type
        self.textContent = textContent
        self.image = image
        self.imagePosition = imagePosition
        self.imageScale = imageScale
    }
    
    init() {
        self.type = nil
        self.textContent = nil
        self.image = nil
        self.imagePosition = nil
        self.imageScale = nil
    }
}

enum MotivationType: Decodable {
    case text
    case image
    case video
    var id: String {
        switch self {
        case .text: return "text"
        case .image: return "image"
        case .video: return "video"
        }
    }
}
