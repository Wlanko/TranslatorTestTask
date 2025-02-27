//
//  PetSpeachGenerator.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 26.02.2025.
//

import Foundation

class PetSpeechGenerator {
    func generateCatSentence(wordCount: Int) -> String {
        let sentencePatterns = [
            "Human, I demand food now!",
            "Purr... maybe nap first, then play.",
            "Meow! You forgot my snack again!",
            "Why is the door closed? I must investigate.",
            "Scritches first, then I shall consider loving you.",
            "I saw a bird outside. We must hunt!",
            "Feed me, love me, let me sleep. That is the way."
        ]
        
        let words = sentencePatterns.randomElement()?.components(separatedBy: " ") ?? ["Meow"]
        let trimmedWords = Array(words.prefix(wordCount))
        
        return trimmedWords.joined(separator: " ") + (trimmedWords.count < words.count ? "..." : "")
    }
    
    func generateDogSentence(wordCount: Int) -> String {
        let sentencePatterns = [
            "Human! Throw the ball!",
            "Bark! Time for a walk?",
            "Food? Treat? Belly rubs? Yes please!",
            "I missed you so much! Even if it was just 5 minutes!",
            "Tail wagging at maximum speed!",
            "Let's run! Let's play! Let's chase!",
            "I love you! Pet me! Now!"
        ]
        
        let words = sentencePatterns.randomElement()?.components(separatedBy: " ") ?? ["Woof"]
        let trimmedWords = Array(words.prefix(wordCount))
        
        return trimmedWords.joined(separator: " ") + (trimmedWords.count < words.count ? "..." : "")
    }
}
