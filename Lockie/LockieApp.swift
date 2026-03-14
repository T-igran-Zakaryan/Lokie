//
//  LockieApp.swift
//  Lockie
//
//  Created by Тигран Закарян on 14.03.26.
//

import SwiftUI

@main
struct LockieApp: App {
    var body: some Scene {
        MenuBarExtra("Lockie", systemImage: "lock.circle.dotted") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
