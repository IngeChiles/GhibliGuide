//  FilmLabel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/3/24.

import Foundation
import SwiftUI

/// Modifier for labeling film titles.
struct FilmLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.forest)
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(.cloud)
            .offset(x: 0, y: 120)
            .shadow(radius: 10, x: 5, y: 10)
    }
}

extension View {
    func filmLabel() -> some View {
        self.modifier(FilmLabelModifier())
    }
}
