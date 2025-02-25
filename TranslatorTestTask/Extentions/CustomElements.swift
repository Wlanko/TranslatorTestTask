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
            .padding(.bottom, 12)
    }
}

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

extension SettingsView{
    func customSettingRow(title: String, action: @escaping () -> URL?, url: Binding<URL?>) -> some View{
        Button {
            url.wrappedValue = action()
        } label: {
            HStack{
                Text(title)
                    .font(Font.custom("Konkhmer Sleokchher", size: 16))
                    .tint(Color(hex: "#393736"))
                    .padding([.vertical, .leading], 14)
                
                Spacer()
                
                Image("chevron.forward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding([.vertical, .trailing], 13)
            }
            .frame(height: 50)
            .background(Color(hex: "#D6DCFF"))
            .cornerRadius(20)
        }
    }
}
