//
//  BrontooTestTests.swift
//  BrontooTestTests
//
//  Created by Webwerks on 01/07/19.
//  Copyright © 2019 Webwerks. All rights reserved.
//

import XCTest
@testable import BrontooTest

class BrontooTestTests: XCTestCase {
    
    let vc = FirstViewController()

    func testDataMessage() {
        XCTAssertEqual(vc.dataMessage, "{name:'Osta', age:'20', dob:'01-07-2019' }")
    }
}
