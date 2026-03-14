//
//  ContentView.swift
//  Lockie
//
//  Created by Тигран Закарян on 14.03.26.
//

import AppKit
import AVFoundation
import SwiftUI

struct ContentView: View {
   @AppStorage("playOnButtonLock") private var playOnButtonLock = true
   @AppStorage("playOnTimeoutLock") private var playOnTimeoutLock = true
   @State private var lockSoundController = LockSoundController()
   
   var body: some View {
      VStack(alignment: .leading, spacing: 8) {
         Label("Lockie is listening for lock events.", systemImage: "lock.fill")
         Text("Lock your Mac (manual or timeout) to play the sound.")
            .font(.caption)
            .foregroundStyle(.secondary)
         HStack {
            Text("Play on lock button")
            Spacer()
            Toggle("", isOn: $playOnButtonLock)
               .labelsHidden()
               .toggleStyle(.switch)
         }
         HStack {
            Text("Play on timeout lock")
            Spacer()
            Toggle("", isOn: $playOnTimeoutLock)
               .labelsHidden()
               .toggleStyle(.switch)
         }
         
         Divider()
         HStack {
            Spacer()
            Button("Quit") {
               NSApp.terminate(nil)
            }
            .clipShape(Capsule())
         }
      }
      .padding(12)
      .frame(width: 260)
   }
}




