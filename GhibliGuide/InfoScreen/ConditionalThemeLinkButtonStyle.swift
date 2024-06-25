//  ConditionalThemeLinkButtonStyle.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/25/24.

import Foundation
import SwiftUI

/// Custom button that accomodates both light mode and dark mode for buttons that open a link in a browser.
struct ConditionalThemeLinkButtonStyle: ButtonStyle {

    /// Enables access to state of device's current theme (dark or light).
    @Environment(\.colorScheme) var colorScheme

    /// Creates custom button and applies conditional custom colors depending on light or dark mode.
    /// - Parameter configuration: A configuration structure that provides
    ///  information about the button’s label and its current state (pressed or not).
    /// - Returns: A view representing the body of the button.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(colorScheme == .dark ? Color.forest : Color.forest)
            .foregroundColor(colorScheme == .dark ? Color.cloud : Color.cloud)
            .cornerRadius(10)
            .shadow(radius: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
