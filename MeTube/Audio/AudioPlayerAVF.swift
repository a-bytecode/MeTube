//
//  AudioPlayerAVF.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.06.23.
//
import Foundation
import SwiftUI
import AVFAudio

class AudioPlayer {
    var player: AVAudioPlayer?

    func playSound(soundFileName: String, soundFileType: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: soundFileType) else {
            print("Sound file not found")
            return
        }

        do {
            
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
            
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}
