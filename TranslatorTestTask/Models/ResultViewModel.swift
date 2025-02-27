//
//  ResultModel.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 27.02.2025.
//

import Foundation

class ResultViewModel {
    let soundPlayer = SoundPlayer()
    
    func playSounds(_ animal: Animals, _ wordCount: Int){
        var sounds = [String]()
        for _ in 0 ..< wordCount {
            sounds.append(animal.sound.randomElement()!)
        }
        soundPlayer.playSoundSequence(sounds: sounds)
    }
}
