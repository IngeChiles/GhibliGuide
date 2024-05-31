//  FilmDetailViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation
class FilmDetailViewModel: ObservableObject {

    @Published var id: String
    @Published var title: String
    @Published var original_title: String
    @Published var image: URL?
    @Published var description: String
    @Published var director: String
    @Published var release_date: String
    @Published var run_time: String

//    private let film: Film

    init(film: Film) {
        self.id = film.id
        self.title = film.title
        self.original_title = film.original_title
        self.image = film.image
        self.description = film.description
        self.director = film.director
        self.release_date = film.release_date
        self.run_time = film.running_time
    }
}
