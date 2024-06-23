//  FilmStampingServiceTests.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 6/2/24.

import Foundation
import XCTest
@testable import GhibliGuide

/// Tests for `FilmStampingService`.
final class FilmStampingServiceTests: XCTestCase {

    /// First test film.
    let testFilm1 = Film(
        id: "4",
        title: "A New Hope",
        originalTitle: "スター・ウォーズ / 新たなる希望",
        image: URL(string: "https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg")!,
        description: """
            Follows young Luke Skywalker as he joins forces \
            with Princess Leia, Han Solo, and Obi-Wan Kenobi \
            to battle the oppressive Galactic Empire and destroy \
            its superweapon, the Death Star. Guided by the Force, \
            Luke becomes a hero in the Rebel Alliance's quest \
            to bring peace to the galaxy.
            """,
        director: "George Lucas",
        releaseDate: "1977",
        runningTime: "121"
    )

    /// Second test film.
    let testFilm2 = Film(
        id: "5",
        title: "The Empire Strikes Back",
        originalTitle: "スターウォーズ 帝国の逆襲",
        image: URL(string: "https://en.wikipedia.org/wiki/File:The_Empire_Strikes_Back_(1980_film).jpg")!,
        description: """
            Sees the Rebel Alliance facing a fierce counterattack \
            from the Galactic Empire, with Han Solo and Princess \
            Leia evading capture while Luke Skywalker trains with \
            Jedi Master Yoda. In a climactic confrontation, Luke \
            learns a devastating truth about his lineage from \
            Darth Vader, setting the stage for the epic conclusion \
            of the trilogy.
            """,
        director: "Richard Marquand",
        releaseDate: "1980",
        runningTime: "124"
    )

    /// Third test film.
    let testFilm3 = Film(
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
    )

    /// The `FilmStampingService` being tested.
    var subject: FilmStampingService!

    /// Clears `UserDefaults` and instantiates the `FilmStampingService` before each test.
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removeObject(forKey: "stampedFilms")

        subject = FilmStampingService()
    }

    /// Following each test, clears `UserDefaults` and deallocates the service, setting subject value to nil.
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "stampedFilms")

        subject = nil

        super.tearDown()
    }

    // MARK: - Test init()

    /// Tests that if a `Film` ID is stored in `UserDefaults`, init() will load it when the service is instantiated.
    func testInitLoadsSavedData() {
        let testFilms: Set<String> = [testFilm1.id]
        if let data = try? JSONEncoder().encode(testFilms) {
            UserDefaults.standard.set(data, forKey: "stampedFilms")
        }

        subject = FilmStampingService()

        XCTAssertEqual(subject.getStampedFilms(), testFilms, "Service should load saved data correctly.")
    }

    /// Tests that if there is no saved data, the result of `getStampedFilms()` is empty.
    func testInitInitializesWithEmptySet() {
        XCTAssertTrue(
            subject.getStampedFilms().isEmpty,
            "Service should initialize with an empty set if no saved data is found."
        )
    }

    // MARK: - Test contains()

    /// Tests that once a film is added to the array, the service returns true for that film.
    func testContainsReturnsTrueForContainedFilm() {
        subject.add(testFilm1)
        XCTAssertTrue(subject.contains(testFilm1), "Service should return true for a film that is contained.")
    }

    /// Tests that if `contains()` is called for a film that has not been added to the service, it returns false.
    func testContainsReturnsFalseForNonContainedFilm() {
        subject.add(testFilm2)
        XCTAssertFalse(subject.contains(testFilm1), "Service should return false for a film that is not contained.")
    }

    // MARK: - Test add()

    /// Tests that when `add()` is called for a film, it is added to the service.
    func testAddAddsFilmToSet() {
        subject.add(testFilm1)
        XCTAssertTrue(subject.contains(testFilm1), "Service should add a film to the set.")
    }

    /// Tests that once a film is added to the service, the data is persisted.
    func testAddPersistsData() {
        subject.add(testFilm1)

        subject = FilmStampingService() // Reinitialize to simulate app restart

        XCTAssertTrue(subject.contains(testFilm1), "Service should persist data across instances.")
    }

    // MARK: - Test remove()

    /// Tests that once `remove()` is called for a film, that film is not in the service.
    func testRemoveRemovesFilmFromSet() {
        subject.add(testFilm1)
        subject.remove(testFilm1)
        XCTAssertFalse(subject.contains(testFilm1), "Service should remove a film from the set.")
    }

    /// Tests that `remove()` only removes the correct film.
    func testRemoveDoesNotRemoveAllFilms() {
        subject.add(testFilm1)
        subject.add(testFilm2)
        subject.remove(testFilm2)
        XCTAssertTrue(subject.contains(testFilm1), "Service should not remove non-removed film from the set.")
    }

    // MARK: - Test getStampedFilms()

    /// Tests that `getStampedFilms()` returns an empty set if there is no persisted data.
    func testGetStampedFilmsReturnsEmptySet() {
        XCTAssertTrue(subject.getStampedFilms().isEmpty)
    }

    /// Tests that if a single film is persisted, `getStampedFilms()` returns it.
    func testGetStampedFilmsReturnsSingleFilm() {
        subject.add(testFilm1)
        XCTAssertEqual(subject.getStampedFilms(), [testFilm1.id])
    }

    /// Tests that if there are multiple films persisted, `getStampedFilms()` returns all of them.
    func testGetStampedFilmsReturnsMultipleFilms() {
        subject.add(testFilm1)
        subject.add(testFilm2)
        subject.add(testFilm3)
        XCTAssertEqual(subject.getStampedFilms(), [testFilm1.id, testFilm2.id, testFilm3.id])
    }
}
