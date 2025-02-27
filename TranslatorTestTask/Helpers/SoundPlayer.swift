//
//  SoundPlayer.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 27.02.2025.
//

import Foundation
import AVFoundation

class SoundPlayer: NSObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    var soundQueue: [URL] = []
    
    func playSoundSequence(sounds: [String]) {
        soundQueue = sounds.compactMap { Bundle.main.url(forResource: $0, withExtension: "mp3") }
        playNextSound()
    }
    
    private func playNextSound() {
        guard !soundQueue.isEmpty else { return }
        
        let soundURL = soundQueue.removeFirst()
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
            playNextSound()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playNextSound()
    }
}
