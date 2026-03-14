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

    func playLockSound() {
        guard let url = Bundle.main.url(forResource: "lock", withExtension: "mp3") else {
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
