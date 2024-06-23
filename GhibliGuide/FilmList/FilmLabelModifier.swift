//  FilmLabel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/3/24.

import Foundation
import SwiftUI

/// Modifier for `Film` labels.
struct FilmLabelModifier: ViewModifier {

    /// Applies custom modifiers.
    /// - Parameter content: content to be modified, in this case, a film label for the `title` 
    /// property on a `Film` object.
    /// - Returns: Modified view.
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

    /// Function to be used in code to apply the above modifiers.
    /// - Returns: Modified view.
    func filmLabel() -> some View {
        self.modifier(FilmLabelModifier())
    }
}
