//  FilmDetailViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmDetailView, which displays film details.
@Observable class FilmDetailViewModel {

    /// `Film` object that contains details about the film.
    var film: Film

    /// Initializes `FilmDetailViewModel`.
    /// - Parameter film: Accepts a `Film` object.
    init(film: Film) {
        self.film = film
    }
}
