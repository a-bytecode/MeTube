//
//  MaxCharacterText.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 02.06.23.
//

import Foundation
import SwiftUI

struct MaxCharacterText: View {
    let text: String
    let maxCharacters: Int

    var body: some View {
        Text(truncateTextIfNeeded())
            .font(.footnote)
            .foregroundColor(Color.white)
    }

    private func truncateTextIfNeeded() -> String {
        if text.count <= maxCharacters {
            return text
        } else {
            let truncatedIndex = text.index(text.startIndex, offsetBy: maxCharacters)
            return String(text[..<truncatedIndex]) + "..."
        }
    }
}
