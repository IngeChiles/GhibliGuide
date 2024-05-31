//  Model.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import Foundation

struct Film: Identifiable, Codable {
//    let filmID: Int?
    let id: String
    let title: String
    let original_title: String
    let image: URL?
    let description: String
    let director: String
    let release_date: String
    let running_time: String
}
