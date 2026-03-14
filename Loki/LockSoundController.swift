//
//  LockSoundController.swift
//  Loki
//
//  Created by Тигран Закарян on 14.03.26.
//


final class LockSoundController: ObservableObject {
    private let soundPlayer = SoundPlayer()
    private var lockObserver: NSObjectProtocol?
    private var resignObserver: NSObjectProtocol?
    private var sleepObserver: NSObjectProtocol?
    private var lastPlayTime: Date?

    init() {
        lockObserver = DistributedNotificationCenter.default()
            .addObserver(forName: .init("com.apple.screenIsLocked"),
                         object: nil,
                         queue: .main) { [weak self] _ in
                self?.playOncePerEventBurst(kind: .button)
            }

        resignObserver = NSWorkspace.shared.notificationCenter
            .addObserver(forName: NSWorkspace.sessionDidResignActiveNotification,
                         object: nil,
                         queue: .main) { [weak self] _ in
                self?.playOncePerEventBurst(kind: .button)
            }

        sleepObserver = NSWorkspace.shared.notificationCenter
            .addObserver(forName: NSWorkspace.screensDidSleepNotification,
                         object: nil,
                         queue: .main) { [weak self] _ in
                self?.playOncePerEventBurst(kind: .timeout)
            }
    }

    deinit {
        if let lockObserver {
            DistributedNotificationCenter.default().removeObserver(lockObserver)
        }
        if let resignObserver {
            NSWorkspace.shared.notificationCenter.removeObserver(resignObserver)
        }
        if let sleepObserver {
            NSWorkspace.shared.notificationCenter.removeObserver(sleepObserver)
        }
    }

    private enum LockKind {
        case button
        case timeout
    }

    private func playOncePerEventBurst(kind: LockKind) {
        let now = Date()
        if let lastPlayTime, now.timeIntervalSince(lastPlayTime) < 1.0 {
            return
        }

        if !shouldPlay(for: kind) {
            return
        }

        lastPlayTime = now
        soundPlayer.playLockSound()
    }

    private func shouldPlay(for kind: LockKind) -> Bool {
        switch kind {
        case .button:
            return UserDefaults.standard.object(forKey: "playOnButtonLock") as? Bool ?? true
        case .timeout:
            return UserDefaults.standard.object(forKey: "playOnTimeoutLock") as? Bool ?? true
        }
    }
}