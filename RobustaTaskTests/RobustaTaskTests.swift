//
//  RobustaTaskTests.swift
//  RobustaTaskTests
//
//  Created by MAJED A  ALGARNI on 12/8/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import XCTest
@testable import RobustaTask

class RobustaTaskTests: XCTestCase {

    let c = calator()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testAddTest() {
        let res = c.cal(num1: 1, num2: 2)
        XCTAssert(res == 3, "Error add")
    }
    
    func testGetRepos() {
        let expectation = XCTestExpectation.init(description: "Your expectation")
        NetworkHandler.getJsonArrayResponse(NetworkRouter.ListRepo + "asfa222", success: { (array) in
            let arr = array as? [String: Any]
            if array.count > 0 {
                expectation.fulfill()
            }
        }) { (error) in
            XCTFail("Fail")
        }
        self.wait(for: [expectation], timeout: 20)
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
