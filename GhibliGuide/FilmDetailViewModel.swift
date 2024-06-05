//  FilmDetailViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmDetailView, which displays a detail view for a film.
class FilmDetailViewModel: ObservableObject {

//    @Published var id: String
//    @Published var title: String
//    @Published var originalTitle: String
//    @Published var image: URL?
//    @Published var description: String
//    @Published var director: String
//    @Published var releaseDate: String
//    @Published var runTime: String

    @Published var film: Film

    init(film: Film) {
        self.film = film
//        self.id = film.id
//        self.title = film.title
//        self.originalTitle = film.originalTitle
//        self.image = film.image
//        self.description = film.description
//        self.director = film.director
//        self.releaseDate = film.releaseDate
//        self.runTime = film.runningTime
    }
}
