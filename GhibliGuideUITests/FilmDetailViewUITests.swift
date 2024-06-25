//  WhenFilmIsStampedThenStampAppears.swift
//  GhibliGuideUITests
//  Made with ♥︎ by Inge Chiles on 6/24/24.

import XCTest

/// UI tests for FilmDetailView.
final class FilmDetailViewUITests: XCTestCase {

    /// App variable scoped to be available for every test function in this class.
    var app: XCUIApplication!

    /// Prepares test environment by initializing and launching the app.
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    /// Tears down app after test is completed.
    override func tearDown() {
        app = nil
        super.tearDown()
    }

    /// Verifies that the stamping service button label changes to a new label when tapped, 
    /// and changes back when tapped again.
    func testStampButtonAddsAndRemovesStampFromFilmDetailView() {

        // Wait for the film cells to load
        let filmCell = app.staticTexts["filmCell_2baf70d1-42bb-4437-b551-e5fed5a87abe"]
        XCTAssertTrue(filmCell.waitForExistence(timeout: 10), "The film cell for the given ID should exist")

        // Tap the first film cell to navigate to the detail view
        filmCell.tap()

        // Find the stamping button
        let stampFilmButton = app.buttons["stampFilmButton"]
        XCTAssertTrue(stampFilmButton.exists, "The stamp film button should exist on the detail view")

        // Make sure the button label initially says "Hey I've seen this one!"
        XCTAssertEqual(stampFilmButton.label, "Hey I've seen this one!",
                       "The button label should initially say 'Hey I've seen this one!'")

        // Tap the button
        stampFilmButton.tap()

        // Make sure the button label changes to ""Remove stamp from film""
        XCTAssertEqual(stampFilmButton.label, "Remove stamp from film",
                       "The button label should change to 'Remove stamp from film'")

        // Tap the button again
        stampFilmButton.tap()

        // Make sure the button label changes to "Hey I've seen this one!"
        XCTAssertEqual(stampFilmButton.label, "Hey I've seen this one!",
                       "The button label should change to 'Hey I've seen this one!'")
    }
}
