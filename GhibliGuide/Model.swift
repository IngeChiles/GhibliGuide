//  Model.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

///  Data model for Film object.
struct Film: Identifiable, Codable, Equatable {

    /// Unique identifier in Ghibli API database.
    let id: String

    /// Title of film.
    let title: String

    /// Original title of film, written in Japanese.
    let originalTitle: String

    /// Movie poster artwork.
    let image: URL?

    /// Plot summary of film.
    let description: String

    /// Director of film.
    let director: String

    /// Year in which film was released.
    let releaseDate: String

    /// Running time of film, in minutes.
    let runningTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case image
        case description
        case director
        case releaseDate = "release_date"
        case runningTime = "running_time"
    }
}
