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
   @AppStorage("selectedSound") private var selectedSound = LockSound.snap
   @State private var lockSoundController = LockSoundController()
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      VStack(alignment: .leading, spacing: 8) {
         Label("Lockie is listening for lock events.", systemImage: "lock.fill")
         Text("Lock your Mac (manual or timeout) to play the sound.")
            .font(.caption)
            .foregroundStyle(.secondary)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
         ToggleRowView(title: "Play on lock button", isOn: $playOnButtonLock)
         ToggleRowView(title: "Play on timeout lock", isOn: $playOnTimeoutLock)
         
         HStack(alignment: .center, spacing: 8) {
            Text("Sound")
               .lineLimit(1)
               .minimumScaleFactor(0.8)
               .frame(maxWidth: .infinity, alignment: .leading)
            Picker("", selection: $selectedSound) {
               ForEach(LockSound.allCases) { sound in
                  Text(verbatim: sound.displayName).tag(sound)
               }
            }
            .labelsHidden()
            .pickerStyle(.menu)
            .frame(width: 100)
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
      .frame(width: 350)
//      .frame(width: 350)
      .background(
         Button("") {
            dismiss()
         }
         .keyboardShortcut(.cancelAction)
         .frame(width: 0, height: 0)
         .opacity(0)
      )
      .onChange(of: selectedSound) { _, newValue in
         lockSoundController.playPreview(sound: newValue)
      }
   }
}





