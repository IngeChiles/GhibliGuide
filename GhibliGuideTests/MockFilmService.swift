//  Mock(umentary)FilmService.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 6/1/24.

import Foundation
@testable import GhibliGuide

/// Mock implementation of film service.
final class MockFilmService: FilmService {

    /// Mock films array.
    var films = [Film(
        id: "6",
        title: "Return of the Jedi",
        originalTitle: "スターウォーズ エピソード6 / ジェダイの帰還",
        image: URL(string: "https://www.example.com/ReturnOfTheJedi.png")!,
        description: """
            After rescuing Han Solo from Jabba the Hutt,\
            the Rebels must attack the second Death Star \
            orbiting above a remote forest moon.
            """,
        director: "Richard Marquand",
        releaseDate: "1983",
        runningTime: "135"
    )]

    /// Returns mock films array.
    func getFilms() async throws -> [Film] {
        return films
    }
}
