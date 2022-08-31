//
//  HomeTests.swift
//  OipieUITests
//
//  Created by Daniel Ramos on 31/8/22.
//

import Nimble
import XCTest

class HomeTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_that_navigates_through_the_tab_bar() throws {
        let app = XCUIApplication()
        app.launch()

        expect(app).to(haveText("Pumpkin Soup"))
    }
}
