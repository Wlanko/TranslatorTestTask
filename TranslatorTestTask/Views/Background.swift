//
//  Background.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI

struct Background: View {
    var body: some View {
        VStack {
            LinearGradient(colors: [Color(hex: "#F3F5F6") ?? .white, Color(hex: "#C9FFE0") ?? .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Background()
}
