//
//  LockSound.swift
//  Lockie
//
//  Created by Тигран Закарян on 12.07.26.
//

import Foundation

enum LockSound: String, CaseIterable, Identifiable {
    case snap = "snap"
    case click = "Click"
    case carLock = "Car lock"
    case carLock2 = "Car lock 2"
    case churchBell = "Church bell"
    case doorLock = "Door Lock"
    case elevator = "Elevator"
    case gearLock = "Gear lock"
    case hotelLobby = "Hotel Lobby"
    case shut = "Shut"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        switch self {
        case .snap:
            return "Snap"
        case .click:
            return "Click"
        case .carLock:
            return "Car Lock"
        case .carLock2:
            return "Car Lock 2"
        case .churchBell:
            return "Church Bell"
        case .doorLock:
            return "Door Lock"
        case .elevator:
            return "Elevator"
        case .gearLock:
            return "Gear Lock"
        case .hotelLobby:
            return "Hotel Lobby"
        case .shut:
            return "Shut"
        }
    }
    
    var filename: String {
        self.rawValue
    }
}
