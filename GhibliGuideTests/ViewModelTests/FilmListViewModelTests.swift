//  FilmListViewModelTests.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import XCTest
@testable import GhibliGuide

/// Tests for `FilmListViewModel`.
final class FilmListViewModelTests: XCTestCase {

    /// The `FilmListViewModel` being tested.
    var subject: FilmListViewModel!

    /// Sets up test environment with a `MockFilmService`.
    override func setUp() {
        super.setUp()

        subject = FilmListViewModel(service: MockFilmService())
    }

    // MARK: - Test loadData()

    /// Tests that `films` array has correct data after `loadData()` is called.
    func testLoadDataUpdatesFilmsArray() async {
        await subject.loadData()

        XCTAssertEqual(subject.films, [Film(
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
        )
    }
}
