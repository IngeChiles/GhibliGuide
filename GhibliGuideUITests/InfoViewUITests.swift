//  InfoViewUITests.swift
//  GhibliGuideUITests
//  Made with ♥︎ by Inge Chiles on 6/24/24.

import XCTest

/// UI Tests for InfoView.
final class InfoViewUITests: XCTestCase {
    /// App variable scoped to be available for every test function in this class.
    var app: XCUIApplication!

    /// Prepares test environment by initializing and launching the app.
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        // The info screen button should exist on the FilmListView
        let infoScreenButton = app.buttons["infoScreenButton"]
        XCTAssertTrue(infoScreenButton.exists, "The info screen button should exist on the FilmListView")

        // Tap the info button to navigate to the "About" section
        infoScreenButton.tap()

        // Make sure the "About" section header for the Info Screen exists
        XCTAssertTrue(app.staticTexts["infoScreenHeader"].exists,
                      "The About section header for the Info Screen should exist")
    }

    /// Tears down app after test is completed.
    override func tearDown() {
        app = nil
        super.tearDown()
    }

    /// Verifies that the back button returns user to grid of films/FilmListView.
    func testBackButtonReturnsToFilmListScreen() {

        // Tap the back button to return to the previous screen
        // The back button is usually the first button in the navigation bar
        let backButton = app.navigationBars.buttons.element(boundBy: 0)

        // Verify that the back button exists
        XCTAssertTrue(backButton.exists, "The back button should exist on the info screen")
        backButton.tap()

        // Verify that we are back on the film list screen
        XCTAssertTrue(app.navigationBars["Ghibli Guide"].exists,
                      "The Ghibli Guide navigation bar should exist after navigating back")
    }

    /// Verifies that the Ghibli API & License button opens a link in the browser.
    func testGhibliAPIandLicenseButtonOpensLinkInBrowser() {
        // Verify that the button exists
        let ghibliAPILinkButton = app.buttons["ghibliAPILinkButton"]
        XCTAssertTrue(ghibliAPILinkButton.exists, "The Ghibli API link button should exist on the info screen")

        // Tap the button
        ghibliAPILinkButton.tap()

        // Pause briefly to allow Safari (or another browser) to open
        sleep(2)

        // Open safari
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        guard safari.wait(for: .runningForeground, timeout: 10) else {
            XCTFail("could not open Safari")
            return
        }

        // We use CONTAINS because at first, only the base URL is displayed inside the text field
        let pred = NSPredicate(format: "value CONTAINS[cd] %@", "vercel.app")
        let addressBar = safari.textFields.element(matching: pred)

        // Tap is needed to reveal the full URL string inside the address bar
        addressBar.tap()

        // Check that the textField matches the URL for the Ghibli API
        let textField = safari.textFields.element(matching: pred)
        XCTAssertEqual(textField.value as? String, "https://ghibliapi.vercel.app")
    }
}
