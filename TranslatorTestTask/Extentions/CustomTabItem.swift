//
//  TabBarCustom.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import Foundation
import SwiftUI

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack(alignment: .center, spacing: 4) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
            
            Text(title)
                .font(Font.custom("Konkhmer Sleokchher", size: 12))
                
        }
        .tint(isActive ? Color(hex: "#292D32") : Color.gray)
        .padding(.horizontal, 24)
        .padding(.vertical, 19)
    }
}
