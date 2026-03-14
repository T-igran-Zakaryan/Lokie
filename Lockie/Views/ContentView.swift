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
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      VStack(alignment: .leading, spacing: 8) {
         Label("Lockie is listening for lock events.", systemImage: "lock.fill")
         Text("Lock your Mac (manual or timeout) to play the sound.")
            .font(.caption)
            .foregroundStyle(.secondary)
         ToggleRowView(title: "Play on lock button", isOn: $playOnButtonLock)
         ToggleRowView(title: "Play on timeout lock", isOn: $playOnTimeoutLock)
         
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
      .background(
         Button("") {
            dismiss()
         }
         .keyboardShortcut(.cancelAction)
         .frame(width: 0, height: 0)
         .opacity(0)
      )
   }
}





