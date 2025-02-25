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
            .font(Font.custom("Konkhmer Sleokchher", size: scale(32)))
            .padding(.bottom, scale(12))
    }
    
    public func customText(_ text: String, size: CGFloat = 16) -> some View {
        Text(text)
            .font(Font.custom("Konkhmer Sleokchher", size: size))
            .foregroundColor(Color.gray)
    }
}

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack(alignment: .center, spacing: scale(4)) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: scale(22), height: scale(22))
            
            Text(title)
                .font(Font.custom("Konkhmer Sleokchher", size: scale(12)))
                
        }
        .tint(isActive ? Color(hex: "#292D32") : Color.gray)
        .padding(.horizontal, scale(24))
        .padding(.vertical, scale(19))
    }
}

extension SettingsView{
    func customSettingRow(title: String, action: @escaping () -> URL?, url: Binding<URL?>) -> some View{
        Button {
            url.wrappedValue = action()
        } label: {
            HStack{
                Text(title)
                    .font(Font.custom("Konkhmer Sleokchher", size: scale(16)))
                    .tint(Color(hex: "#393736"))
                    .padding([.vertical, .leading], scale(14))
                
                Spacer()
                
                Image("chevron.forward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: scale(24), height: scale(24))
                    .padding([.vertical, .trailing], scale(13))
            }
            .frame(height: scale(50))
            .background(Color(hex: "#D6DCFF"))
            .cornerRadius(scale(20))
        }
    }
}
