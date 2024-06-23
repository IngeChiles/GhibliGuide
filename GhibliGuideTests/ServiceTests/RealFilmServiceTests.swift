//  RealFilmServiceTests.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 6/4/24.

import Foundation
import XCTest
@testable import GhibliGuide

/// Tests for `RealFilmService`.
final class RealFilmServiceTests: XCTestCase {

    /// The `RealFilmService` being tested.
    var subject: RealFilmService!

    /// Sets up test environment with a `RealFilmService`.
    override func setUp() {
        super.setUp()

        subject = RealFilmService()
    }

    /// Deallocates the service following test run.
    override func tearDown() {

        subject = nil

        super.tearDown()
    }

    // MARK: - Test loadData()

    /// Tests that `loadData()` responds with a non-empty array of films.
    func testLoadDataReturnsFilms() async {
        do {
            let films = try await subject.getFilms()
            XCTAssertFalse(films.isEmpty)
        } catch {
            XCTFail("Failed with error \(error.localizedDescription).")
        }
    }
}
