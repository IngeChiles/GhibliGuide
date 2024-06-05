//  FilmDetailViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmDetailView, which displays a detail view for a film.
class FilmDetailViewModel: ObservableObject {
    @Published var film: Film

    init(film: Film) {
        self.film = film
    }
}
