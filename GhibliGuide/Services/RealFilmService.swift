//  RealFilmService.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// Enables dependency injection and testing by creating a standard for both test and real services to follow.
protocol FilmService {
    /// Gets array of `Film` objects from a service.
    /// - Returns: An array of `Film` objects.
    func getFilms() async throws -> [Film]
}

/// Error cases to be thrown by getFilms().
enum GFError: Error {
    case invalidURL
    case networkError
}

/// A service that uses `URLSession()` to return and `JSONDecoder()` to decode an array of `Film` objects from the Studio Ghibli API.
class RealFilmService: FilmService {
    /// Instance of `URLSession` to be passed into getFilms().
    private let session = URLSession.shared

    /// Decodes and returns an array of Film objects from Ghibli API.
    /// - Returns: Decoded array of `Film` objects.
    func getFilms() async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw GFError.invalidURL
        }

        let request = URLRequest(url: url)

        let (data, _) = try await session.data(for: request)

        let filmsResponse = try JSONDecoder().decode([Film].self, from: data)

        return filmsResponse
    }
}
