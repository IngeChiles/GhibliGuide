//  FilmDetailViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmDetailView, which displays a detail view for a film.
@Observable class FilmDetailViewModel {

    /// `Film` object will be passed through this property from `FilmDetailViewModel` to `FilmDetailView`.
    var film: Film

    /// Initializes `FilmDetailViewModel`.
    /// - Parameter film: Accepts a `Film` object.
    init(film: Film) {
        self.film = film
    }
}
