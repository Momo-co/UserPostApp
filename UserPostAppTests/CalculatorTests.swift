//
//  CalculatorTests.swift
//  UserPostAppTests
//
//  Created by Suman Gurung on 20/11/2021.
//

import XCTest
@testable import UserPostApp

class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        // GIVEN
        let c1 = Calculator()
        let a = 5
        let b = 10
        // THEN
        let expectedOutput = 15
        let actualOutput = c1.add(num1: a, num2: b)
        // WHEN
        XCTAssertEqual(expectedOutput, actualOutput)
        
    }
}
