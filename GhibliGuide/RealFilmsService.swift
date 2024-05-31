//  FilmsService.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

protocol FilmsServiceProtocol {
    func getFilms() async throws -> [Film]
}

enum URLError: Error {
    case invalidURL
    case networkError
}

class RealFilmsService: FilmsServiceProtocol {
    private let session = URLSession.shared

    func getFilms() async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            return []
        }

        let request = URLRequest(url: url)

        let (data, _) = try await session.data(for: request)

        let filmsResponse = try JSONDecoder().decode([Film].self, from: data)

        return filmsResponse
    }
}
