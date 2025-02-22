//
//  CustomElements.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import Foundation
import SwiftUI

extension View {
    public func Title(_ text: String) -> some View {
        Text(text)
            .font(Font.custom("Konkhmer Sleokchher", size: 32))
            .fontWeight(.bold)
            .padding(.bottom, 12)
    }
}
