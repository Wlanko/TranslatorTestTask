//
//  CurrentUIWindow.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 24.02.2025.
//

import Foundation
import SwiftUI

public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }
        return window
    }
}
