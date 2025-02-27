//
//  Animals.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import Foundation

enum Animals: Int, CaseIterable {
    case cat = 0
    case dog
    
    var imageName: String {
        switch self {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }
    
    var hexBackgroundColor: String {
        switch self {
        case .cat:
            return "#D1E7FC"
        case .dog:
            return "#ECFBC7"
        }
    }
    
    var fromPetSpeachTranslator: (_: Int) -> String {
        switch self {
        case .cat:
            return PetSpeechGenerator().generateCatSentence
        case .dog:
            return PetSpeechGenerator().generateDogSentence
        }
    }
    
    var sound: [String] {
        switch self {
        case .cat:
            return ["Meow1", "Meow2", "Meow3", "Meow4"]
        case .dog:
            return ["Woof1", "Woof2", "Woof3"]
        }
    }
}
