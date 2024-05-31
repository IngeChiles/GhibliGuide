//  FilmsViewModel.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

class FilmsListViewModel: ObservableObject {

    private let service: RealFilmsService

    @Published var films: [Film] = []

    init(service: RealFilmsService) {
        self.service = service
    }

    func loadData() async {
        do {
            self.films = try await service.getFilms()
            print(films)
        } catch {
            print(error)
        }
    }
}
