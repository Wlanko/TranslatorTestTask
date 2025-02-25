//
//  ScreenParametersAndScaling.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 25.02.2025.
//

import Foundation
import SwiftUI
import UIKit

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension View {
    public func scale(_ value: CGFloat) -> CGFloat {
        return value * (UIScreen.screenHeight / 844)
    }
}
