//  GhibliGuideApp.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

@main
struct GhibliGuideApp: App {
    @State private var filmStamped = FilmStampingService()
    init() {
        //        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "CactusClassicalSerif-Regular", size: 50)!]

        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "CactusClassicalSerif-Regular", size: 20)!]

        //        UINavigationBar.appearance().tintColor = .white

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
