//  GhibliGuideUITests.swift
//  GhibliGuideUITests
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import XCTest
@testable import GhibliGuide

final class GhibliGuideUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFilmListViewElements() throws {

           // Verify the navigation bar title
           let navigationBar = app.navigationBars["Ghibli Guide"]
           XCTAssertTrue(navigationBar.exists, "The navigation bar title is not displayed correctly.")

           // Check the Info button in the toolbar
           let infoButton = app.buttons["info"]
           XCTAssertTrue(infoButton.exists, "The info button is not displayed.")
           XCTAssertTrue(infoButton.isHittable, "The info button is not tappable.")

           // Check for ProgressView initially if the data is loading
           let progressView = app.otherElements["ProgressView"]
           XCTAssertTrue(progressView.exists, "The progress view is not displayed while loading films.")

           // Assuming that the films data will be loaded, we can wait for a few seconds
           let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == 1"), object: app.cells.firstMatch)
           let result = XCTWaiter().wait(for: [expectation], timeout: 10)
           XCTAssertEqual(result, .completed, "Films were not loaded in time.")

           // Verify that the films list contains cells
           let filmCells = app.cells
           XCTAssertTrue(filmCells.count > 0, "There should be at least one film cell displayed.")

           // Tap the first film cell and verify the navigation to the detail view
           if let firstFilmCell = filmCells.firstMatch as? XCUIElement {
            firstFilmCell.tap()

            // Verify navigation to the FilmDetailView
            let filmDetailView = app.otherElements["FilmDetailView"]
            XCTAssertTrue(filmDetailView.exists, "Failed to navigate to the Film Detail View.")
           }
       }
}
