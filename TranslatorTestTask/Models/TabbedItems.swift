//
//  SelectorModel.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import Foundation

enum TabbedItems: Int, CaseIterable {
    case translator = 0
    case clicker
    
    var title: String {
        switch self {
        case .translator:
            return "Translator"
        case .clicker:
            return "Clicker"
        }
    }
    
    var tabBarItemImage: String {
        switch self {
        case .translator:
            return "bubble.left.and.bubble.right"
        case .clicker:
            return "gearshape"
        }
    }
}
