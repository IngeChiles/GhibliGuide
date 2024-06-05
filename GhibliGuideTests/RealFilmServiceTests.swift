//  RealFilmServiceTests.swift
//  GhibliGuideTests
//  Made with ♥︎ by Inge Chiles on 6/4/24.

import Foundation
import XCTest
@testable import GhibliGuide

final class RealFilmServiceTests: XCTestCase {

    var subject: RealFilmService!

    override func setUp() {
        super.setUp()

        subject = RealFilmService()
    }

    override func tearDown() {

        // Deallocate the service
        subject = nil

        super.tearDown()
    }

    // MARK: - Test loadData()
    func testLoadDataReturnsFilms() async {
        do {
            let films = try await subject.getFilms()
            XCTAssertFalse(films.isEmpty)
        } catch {
            XCTFail("Failed with error \(error.localizedDescription).")
        }
    }
}
