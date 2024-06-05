//  FilmStampingService.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/2/24.

import Foundation
// Todo: make sure that when film is stamped, it immediately adds stamp to the view

/// Class that stores a user's favorited films.
@Observable
class FilmStampingService {
    private var films: Set<String>

    private let key = "stampedFilms"

    init() {
        /// Load our saved data.
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                films = decoded
                return
            }
        }
        films = []
    }

    /// Returns true if our set contains this film.
    func contains(_ film: Film) -> Bool {
        films.contains(film.id)
    }

    /// Adds the film to our set and saves the change.
    func add(_ film: Film) {
        films.insert(film.id)
        save()
    }

    /// Removes the film from our set and saves the change.
    func remove(_ film: Film) {
        films.remove(film.id)
        save()
    }

    /// Returns all stamped films. This will be useful in a future version that 
    /// will include a "Watched Films" collection.
    func getStampedFilms() -> Set<String> {
        return films
    }

    /// Saves changes to user defaults/app storage.
    private func save() {
        if let data = try? JSONEncoder().encode(films) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
