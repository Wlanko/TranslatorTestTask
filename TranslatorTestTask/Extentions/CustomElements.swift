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
            .tint(Color(hex: "#292D32"))
            .font(Font.custom("Konkhmer Sleokchher", size: scale(32)))
            .padding(.bottom, scale(12))
    }
    
    public func CustomText(_ text: String, size: CGFloat = 16) -> some View {
        Text(text)
            .tint(Color(hex: "#292D32"))
            .font(Font.custom("Konkhmer Sleokchher", size: size))
    }
}

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack(alignment: .center, spacing: scale(4)) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: scale(22), height: scale(22))
            
            Text(title)
                .font(Font.custom("Konkhmer Sleokchher", size: scale(12)))
                
        }
        .tint(Color(hex: "#292D32"))
        .opacity(isActive ? 1 : 0.6)
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

extension TranslatorView {
    func visualizeAudioLevels() -> some View{
        HStack(spacing: 4) {
            ForEach(audioMonitor.audioLevels, id: \..self) { level in
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.blue)
                    .frame(width: 2, height: CGFloat(level) * 200)
            }
        }
        .frame(height: scale(95))
        .onAppear {
            audioMonitor.startMonitoring()
        }
        .onDisappear {
            wordCount.wrappedValue = audioMonitor.stopMonitoring()
            isTranslating = true
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 4.05, y: 110.38))
        path.addLine(to: CGPoint(x: 68.38, y: 0.22))
        path.addLine(to: CGPoint(x: 77.13, y: 5.82))
        path.addLine(to: CGPoint(x: 4.05, y: 110.38))
        
        return path
    }
}
