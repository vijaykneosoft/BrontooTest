//
//  BrontooTestUITests.swift
//  BrontooTestUITests
//
//  Created by Webwerks on 01/07/19.
//  Copyright © 2019 Webwerks. All rights reserved.
//

import XCTest

class BrontooTestUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
        
        app = XCUIApplication()
        
        app.launchArguments.append("--uitesting")
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testSwipe() {
        app.launch()
        
        app.buttons["Open WebView"].tap()
        
        app.buttons["Item1"].tap()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
