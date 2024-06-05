//  FilmLabel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/3/24.

import Foundation
import SwiftUI

/// Modifier for labeling film titles.
struct FilmLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(.walnut)
            .multilineTextAlignment(.center)
            .foregroundStyle(.cream)
            .offset(x: 0, y: 130)
            .shadow(radius: 10, x: 5, y: 10)
    }
}

extension View {
    func filmLabel() -> some View {
        self.modifier(FilmLabelModifier())
    }
}
