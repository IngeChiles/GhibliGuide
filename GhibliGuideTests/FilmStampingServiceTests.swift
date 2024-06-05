//  FilmStampingServiceTests.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 6/2/24.

import Foundation
import XCTest
@testable import GhibliGuide

final class FilmStampingServiceTests: XCTestCase {

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

    var subject: FilmStampingService!

    override func setUp() {
        super.setUp()
        // Clear UserDefaults before each test
        UserDefaults.standard.removeObject(forKey: "stampedFilms")

        subject = FilmStampingService()
    }

    override func tearDown() {
        // Clear UserDefaults after each test
        UserDefaults.standard.removeObject(forKey: "stampedFilms")

        // Deallocate the service
        subject = nil

        super.tearDown()
    }

    // MARK: - Test init()

    func testInitLoadsSavedData() {
        let testFilms: Set<String> = [testFilm1.id]
        if let data = try? JSONEncoder().encode(testFilms) {
            UserDefaults.standard.set(data, forKey: "stampedFilms")
        }

        subject = FilmStampingService()

        XCTAssertEqual(subject.getStampedFilms(), testFilms, "Service should load saved data correctly")
    }

    func testInitInitializesWithEmptySet() {
        XCTAssertTrue(
            subject.getStampedFilms().isEmpty,
            "Service should initialize with an empty set if no saved data is found"
        )
    }

    // MARK: - Test contains()

    func testContainsReturnsTrueForContainedFilm() {
        subject.add(testFilm1)
        XCTAssertTrue(subject.contains(testFilm1), "Service should return true for a film that is contained")
    }

    func testContainsReturnsFalseForNonContainedFilm() {
        subject.add(testFilm2)
        XCTAssertFalse(subject.contains(testFilm1), "Service should return false for a film that is not contained")
    }

    // MARK: - Test add()

    func testAddAddsFilmToSet() {
        subject.add(testFilm1)
        XCTAssertTrue(subject.contains(testFilm1), "Service should add a film to the set")
    }

    func testAddPersistsData() {
        subject.add(testFilm1)

        subject = FilmStampingService() // Reinitialize to simulate app restart

        XCTAssertTrue(subject.contains(testFilm1), "Service should persist data across instances")
    }

    // MARK: - Test remove()

    func testRemoveRemovesFilmFromSet() {
        subject.add(testFilm1)
        subject.remove(testFilm1)
        XCTAssertFalse(subject.contains(testFilm1), "Service should remove a film from the set")
    }

    func testRemoveDoesNotRemoveAllFilms() {
        subject.add(testFilm1)
        subject.add(testFilm2)
        subject.remove(testFilm2)
        XCTAssertTrue(subject.contains(testFilm1), "Service should not remove non-removed film from the set")
    }

    // MARK: - Test getStampedFilms()
    func testGetStampedFilmsReturnsEmptySet() {
        XCTAssertTrue(subject.getStampedFilms().isEmpty)
    }

    func testGetStampedFilmsReturnsSingleFilm() {
        subject.add(testFilm1)
        XCTAssertEqual(subject.getStampedFilms(), [testFilm1.id])
    }

    func testGetStampedFilmsReturnsMultipleFilms() {
        subject.add(testFilm1)
        subject.add(testFilm2)
        subject.add(testFilm3)
        XCTAssertEqual(subject.getStampedFilms(), [testFilm1.id, testFilm2.id, testFilm3.id])
    }
}
