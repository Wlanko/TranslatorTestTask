//
//  TabView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI

struct MainTabbedView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab){
                TranslatorView()
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
                .frame( height: 82)
                .background(.white)
                .cornerRadius(16)
            }
        }
    }
}

#Preview {
    MainTabbedView()
}
