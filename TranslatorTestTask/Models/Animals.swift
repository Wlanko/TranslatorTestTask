//
//  Animals.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import Foundation

enum Animals: Int, CaseIterable {
    case cat = 0
    case dog
    
    var imageName: String {
        switch self {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }
    
    var hexBackgroundColor: String {
        switch self {
        case .cat:
            return "#D1E7FC"
        case .dog:
            return "#ECFBC7"
        }
    }
}
