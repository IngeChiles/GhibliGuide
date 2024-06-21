//  GhibliGuideApp.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

@main
/// Root `App` folder for GhibliGuide.
struct GhibliGuideApp: App {
    /// Source of truth instantiation of `FilmStampingService` that all other views draw their
    ///  stampedFilms from, initializes the service and loads user's "watched" films from
    ///   `UserDefaults` when app loads.
    @State private var filmStamped = FilmStampingService()
    
    /// Custom initializer that forces SwiftUI to use "CactusClassicalSerif-Regular" as the custom
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
