//
//  AudioMonitor.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 26.02.2025.
//

import Foundation
import AVFoundation

class AudioMonitor: ObservableObject {
    private var audioRecorder: AVAudioRecorder?
    private var timer: Timer?
    @Published var audioLevels: [Float] = Array(repeating: 0.01, count: 25)
    
    private var peackCounter: Int = 0
    
    func startMonitoring() {
        audioLevels = Array(repeating: 0.01, count: 25)
        
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
        try? audioSession.setActive(true)
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
        ]
        
        let url = URL(fileURLWithPath: "/dev/null")
        try? audioRecorder = AVAudioRecorder(url: url, settings: settings)
        audioRecorder?.isMeteringEnabled = true
        audioRecorder?.record()
        
        peackCounter = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.audioRecorder?.updateMeters()
            let level = pow(10, (self.audioRecorder?.averagePower(forChannel: 0) ?? -160) / 20)
            DispatchQueue.main.async {
                self.audioLevels.removeFirst()
                self.audioLevels.append(level)
                
                print(level)
                
                let lastLevelIndex = self.audioLevels.count - 1
                
                if self.audioLevels[lastLevelIndex] < self.audioLevels[lastLevelIndex - 1] &&
                    self.audioLevels[lastLevelIndex - 1] > self.audioLevels[lastLevelIndex - 2] &&
                    self.audioLevels[lastLevelIndex] > 0.02 {
                    self.peackCounter += 1
                }
            }
        }
    }
    
    func stopMonitoring() -> Int {
        audioRecorder?.stop()
        timer?.invalidate()
        
        return peackCounter
    }
}
