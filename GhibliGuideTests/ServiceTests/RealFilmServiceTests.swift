//  RealFilmServiceTests.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 6/4/24.

import Foundation
import XCTest
@testable import GhibliGuide

final class RealFilmServiceTests: XCTestCase {

    var subject: RealFilmService!

    /// Creates the service prior to test run.
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
    /// Tests that loadData() responds with a non-empty array of films.
    func testLoadDataReturnsFilms() async {
        do {
            let films = try await subject.getFilms()
            XCTAssertFalse(films.isEmpty)
        } catch {
            XCTFail("Failed with error \(error.localizedDescription).")
        }
    }
}
