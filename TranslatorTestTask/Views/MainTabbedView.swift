//
//  TabView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI

struct MainTabbedView: View {
    @State private var showTranslation: Bool = false
    @State private var wordCount: Int = 0
    @State private var animal: Animals = .cat
    @State private var from: String = "HUMAN"
    @State private var selectedTab: Int = 0
    
    var body: some View {
        if !showTranslation {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab){
                    TranslatorView(showTranslation: $showTranslation, wordCount: $wordCount, from: $from, animalToPass: $animal)
                        .tag(0)
                    SettingsView()
                        .tag(1)
                }
                
                ZStack {
                    HStack {
                        ForEach(TabbedItems.allCases, id: \.self) {item in
                            Button {
                                selectedTab = item.rawValue
                            } label : {
                                CustomTabItem(imageName: item.tabBarItemImage, title: item.title, isActive: selectedTab == item.rawValue)
                            }
                        }
                    }
                    .frame( height: scale(82))
                    .background(.white)
                    .cornerRadius(16)
                    .padding(.bottom, scale(16))
                }
            }
        } else {
            ResultView(from: from, animal: animal, showTranslation: $showTranslation, wordCount: wordCount)
        }
    }
}

#Preview {
    MainTabbedView()
}
