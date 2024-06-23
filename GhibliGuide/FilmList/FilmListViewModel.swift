//  FilmsViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmsListView, which provides an array of `Film` objects.
@Observable class FilmListViewModel {

    /// `FilmService` for loading `Film` objects from network.
    private let service: FilmService

    ///  Array of `Film` objects to be surfaced in `FilmListView`.
    var films: [Film] = []

    /// Displays an error alert to user if true.
    var errorAlert = false

    /// Initializes a`FilmListViewModel` with a `FilmService`.
    init(service: FilmService) {
        self.service = service
    }

    /// Loads data from `FilmService`.
    @MainActor func loadData() async {
        do {
            self.films = try await service.getFilms()
        } catch {
            errorAlert = true
        }
    }
}
