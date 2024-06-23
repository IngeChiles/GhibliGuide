//  FilmStampingService.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/2/24.

import Foundation

/// Service that allows for stamping and un-stamping a `Film` that uses `UserDefaults` for persistence.
/// Stamping is a way for the user to mark a `Film` as watched.
@Observable
class FilmStampingService {

    /// A set of IDs for`Film` objects that have been stamped.
    private var stampedFilms: Set<String>

    /// Key for loading and saving IDs to and from `UserDefaults`.
    private let key = "stampedFilms"

    /// Loads saved data from `UserDefaults`.
    init() {
        // Load our saved data.
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                stampedFilms = decoded
                return
            }
        }
        stampedFilms = []
    }

    /// Returns true if `Film` is stamped.
    /// - Parameter film: `Film` object.
    /// - Returns: Whether or not `stampedFilms` contains the ID of a `Film` object.
    func contains(_ film: Film) -> Bool {
        stampedFilms.contains(film.id)
    }

    /// Marks a `Film` as stamped, and saves to `UserDefaults`.
    /// - Parameter film: `Film` object that user has marked as "watched".
    func add(_ film: Film) {
        stampedFilms.insert(film.id)
        save()
    }

    /// Removes the film from our set and saves to `UserDefaults`.
    /// - Parameter film: `Film` object that user has removed from "watched".
    func remove(_ film: Film) {
        stampedFilms.remove(film.id)
        save()
    }

    /// Returns all stamped films. This will be useful in a future version that 
    /// will include a "Watched Films" collection.
    /// - Returns: Latest set of `Film` IDs marked as "watched".
    func getStampedFilms() -> Set<String> {
        return stampedFilms
    }

    /// Saves changes to `UserDefaults`.
    private func save() {
        if let data = try? JSONEncoder().encode(stampedFilms) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
