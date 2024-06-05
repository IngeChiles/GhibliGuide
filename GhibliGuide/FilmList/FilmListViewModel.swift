//  FilmsViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// ViewModel for FilmsListView, which loads an array of Film objects from a FilmService.
class FilmListViewModel: ObservableObject {

    private let service: FilmService

    @Published var films: [Film] = []

    init(service: FilmService) {
        self.service = service
    }

    /// Function which loads data from FilmService.
    @MainActor func loadData() async {
        do {
            self.films = try await service.getFilms()
            print(films)
        } catch {
            print(error)
        }
    }
}
