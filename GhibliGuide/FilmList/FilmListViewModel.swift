//  FilmsViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmsListView, which loads an array of Film objects from a FilmService.
@Observable class FilmListViewModel {

    /// Creates a `Film Service` when `FilmListViewModel` is initialized.
    private let service: FilmService

    ///  Array of `Film` objects to be surfaced in `FilmListView`.
    var films: [Film] = []

    /// Initializes a`FilmListViewModel` with a `FilmService`.
    init(service: FilmService) {
        self.service = service
    }

    /// Function which loads data from `FilmService`.
    @MainActor func loadData() async {
        do {
            self.films = try await service.getFilms()
        } catch {
        }
    }
}
