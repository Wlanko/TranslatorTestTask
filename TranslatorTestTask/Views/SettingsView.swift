//
//  ClickerView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI
import QuickLook

struct SettingsView: View {
    @State public var documentUrl: URL?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                VStack{
                    Title("Settings")
                    
                    ScrollView{
                        ForEach(SettingsItems.allCases, id: \.self) { item in
                            customSettingRow(title: item.itemName, action: item.action, url: $documentUrl)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .quickLookPreview($documentUrl)
        }
    }
}

#Preview {
    SettingsView()
}
