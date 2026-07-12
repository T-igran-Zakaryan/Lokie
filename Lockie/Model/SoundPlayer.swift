//
//  SoundPlayer.swift
//  Lockie
//
//  Created by Тигран Закарян on 14.03.26.
//
import AVFoundation
import AVKit

final class SoundPlayer {
    private var audioPlayer: AVAudioPlayer?

    func playSound(named name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3") ??
                  Bundle.main.url(forResource: name, withExtension: "wav")
        
        guard let url else {
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // Ignore playback errors to avoid interrupting the menu bar experience.
        }
    }
}
