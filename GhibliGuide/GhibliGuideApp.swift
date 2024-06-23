//  GhibliGuideApp.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

/// Root `App` folder for GhibliGuide.
@main
struct GhibliGuideApp: App {

    /// Source of truth instance of `FilmStampingService` that all other views draw their
    ///  stampedFilms from, loads user's "watched" films from `UserDefaults` when app loads.
    @State private var filmStamped = FilmStampingService()

    /// Initializer that forces SwiftUI to use "CactusClassicalSerif-Regular" as the custom
    ///  font for NavigationBar and NavigationBackBarButton.
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont(name: "CactusClassicalSerif-Regular", size: 50)!,
            .foregroundColor: UIColor.oakLeaf
        ]

        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(name: "CactusClassicalSerif-Regular", size: 30)!,
            .foregroundColor: UIColor.oakLeaf
        ]

        if let font = UIFont(name: "CactusClassicalSerif-Regular", size: 16) {
            UIBarButtonItem.appearance().setTitleTextAttributes([
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.forest
            ], for: .normal)
        }
    }

    var body: some Scene {
        WindowGroup {
            FilmListView()
                .environment(filmStamped)
        }
    }
}
