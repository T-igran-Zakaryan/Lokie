//
//  ToggleRow.swift
//  Lockie
//
//  Created by Тигран Закарян on 14.03.26.
//
import AppKit
import SwiftUI

struct ToggleRowView: View {
    let title: LocalizedStringKey
    @Binding var isOn: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(title)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .frame(maxWidth: .infinity, alignment: .leading)
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .toggleStyle(.switch)
        }
    }
}
