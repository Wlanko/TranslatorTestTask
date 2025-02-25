//
//  SettingsItems.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 24.02.2025.
//

import Foundation
import StoreKit
import SwiftUI

enum SettingsItems: Int, CaseIterable {
    case rateUs = 0
    case shareApp
    case contactUs
    case restorePurchases
    case privacyPolicy
    case termsOfUse
    
    var itemName: String {
        switch self {
        case .rateUs: return "Rate Us"
        case .shareApp: return "Share App"
        case .contactUs: return "Contact Us"
        case .restorePurchases: return "Restore Purchases"
        case .privacyPolicy: return "Privacy Policy"
        case .termsOfUse: return "Terms of Use"
        }
    }
    
    var action: () -> URL? {
        switch self {
        case .rateUs: return {
            DispatchQueue.main.async {
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    AppStore.requestReview(in: scene)
                }
            }
            
            return nil
        }
        case .shareApp: return {
            let url = URL(string: "https://youtu.be/xvFZjo5PgG0?si=4QxVtyu9MR4j-9Wa")!
            let activityVC = UIActivityViewController(activityItems: [url as Any], applicationActivities: nil)
                        UIApplication.shared.currentUIWindow()?.rootViewController?.present(activityVC, animated: true, completion: nil)
            
            return nil
        }
        case .contactUs: return {
#if os(iOS)
            UIApplication.shared.open(URL(string: "https://echocode.app/#contacts")!)
#endif
            return nil
        }
        case .restorePurchases: return {
            Task.init {
                try? await AppStore.sync()
            }
            
            return nil
        }
        case .privacyPolicy: return {
            let url = Bundle.main.url(forResource: "PrivacyPolicy", withExtension: "pdf")!
            return url
        }
        case .termsOfUse: return {
            let url = Bundle.main.url(forResource: "TermsOfUse", withExtension: "pdf")!
            
            return url
        }
        }
    }
    
}
