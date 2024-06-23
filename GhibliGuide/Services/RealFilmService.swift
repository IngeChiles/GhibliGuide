//  RealFilmService.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

/// Enables dependency injection and testing by creating a standard for both test and real services to follow.
protocol FilmService {

    /// Gets array of `Film` objects.
    /// - Returns: An array of `Film` objects.
    func getFilms() async throws -> [Film]
}

/// Errors thrown by `FilmService`.
enum FilmServiceError: Error {
    case invalidURL
    case networkError
    case decodingError
    case unknownError
}

/// A service that uses `URLSession` and`JSONDecoder` to download and decode an array of
/// `Film` objects from the Studio Ghibli API.
class RealFilmService: FilmService {

    /// Instance of `URLSession` to be passed into getFilms().
    private let session = URLSession.shared

    /// Downloads, decodes, and returns an array of Film objects from Ghibli API.
    /// - Returns: Decoded array of `Film` objects.
    func getFilms() async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw FilmServiceError.invalidURL
        }

        let request = URLRequest(url: url)

        do {
            let (data, _) = try await session.data(for: request)

            let filmsResponse = try JSONDecoder().decode([Film].self, from: data)

            return filmsResponse

        } catch is URLError {
            throw FilmServiceError.networkError

        } catch is DecodingError {
            throw FilmServiceError.decodingError

        } catch {
            throw FilmServiceError.unknownError
        }
    }
}
