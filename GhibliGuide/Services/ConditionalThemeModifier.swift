//  ConditionalThemeModifier.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/24/24.

import Foundation
import SwiftUI

/// Conditional theme modifier that applies custom colors for light mode and dark mode.
struct ConditionalThemeModifier: ViewModifier {

    /// Enables access to state of device's current theme (dark or light).
    @Environment(\.colorScheme) var colorScheme

    /// Applies dark or light custom theme colors to a view.
    /// - Parameter content: content to be modified, in this case a screen.
    /// - Returns: Screen modified for dark or light mode.
    func body(content: Content) -> some View {
        content
            .background(colorScheme == .dark ? Color.oakLeaf : Color.cream)
            .accentColor(colorScheme == .dark ? Color.oakLeaf : Color.forest)
            .tint(colorScheme == .dark ? Color.cloud : Color.forest)
    }
}

extension View {
    /// Use this function in code to apply the above theme to a screen.
    /// - Returns: A screen that will happily accomodate both light and dark modes.
    func conditionalTheme() -> some View {
        self.modifier(ConditionalThemeModifier())
    }
}
