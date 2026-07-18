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
    case stick = "Stick"
    case reverbed = "Reverbed"
    case wipe = "Wipe"
    case rim = "Rim"
    case xlop = "Xlop"
    case tambDoor = "TambDoor"
    case snazz = "Snazz"
    case bass = "Bass"
    
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
        case .stick:
            return "Stick"
        case .reverbed:
            return "Reverbed"
        case .wipe:
            return "Wipe"
        case .rim:
            return "Rim"
        case .xlop:
            return "Xlop"
        case .tambDoor:
            return "TambDoor"
        case .snazz:
            return "Snazz"
        case .bass:
            return "Bass"
        }
    }
    
    var filename: String {
        self.rawValue
    }
}
