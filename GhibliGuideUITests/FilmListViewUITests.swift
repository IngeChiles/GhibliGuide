//  FilmListViewUITests.swift
//  GhibliGuideUITests
//  Made with ♥︎ by Inge Chiles on 6/24/24.

import XCTest

/// UI tests for FilmListView.
final class FilmListViewUITests: XCTestCase {

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

    /// Verifies that the Info button pushes to the "About" screen/InfoView.
    func testInfoButtonOpensInfoScreen() {

        // The info screen button should exist on the FilmListView
        let infoScreenButton = app.buttons["infoScreenButton"]
        XCTAssertTrue(infoScreenButton.exists, "The info screen button should exist on the FilmListView")

        // Tap the info button to navigate to the "About" section
        infoScreenButton.tap()

        // Make sure he About section header for the Info Screen exists
        XCTAssertTrue(app.staticTexts["infoScreenHeader"].exists,
                      "The About section header for the Info Screen should exist")
    }

    /// Verify that tapping on a film pushes to a detail screen/FilmDetailView.
    func testTappingOnFilmCellNavigatesToFilmDetailScreen() {
        // Wait for the film cells to load
        let filmCell = app.staticTexts["filmCell_2baf70d1-42bb-4437-b551-e5fed5a87abe"]
        XCTAssertTrue(filmCell.waitForExistence(timeout: 10), "The film cell for the given ID should exist")

        // Tap the first film cell to navigate to the detail view
        filmCell.tap()

        // Make sure the detail view for the film exists
        let filmTitle = app.staticTexts["filmTitle_2baf70d1-42bb-4437-b551-e5fed5a87abe"]
        XCTAssertTrue(filmTitle.waitForExistence(timeout: 10), "The film title for the given ID should show up")
    }

}
