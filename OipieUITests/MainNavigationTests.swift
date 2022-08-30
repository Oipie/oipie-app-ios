//
//  OipieUITests.swift
//  OipieUITests
//
//  Created by Daniel Ramos on 26/8/22.
//

import Nimble
import XCTest

class MainNavigationTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_that_navigates_through_the_tab_bar() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Favourites"].tap()

        expect(app).to(haveText("Favourites View"))
    }
}
