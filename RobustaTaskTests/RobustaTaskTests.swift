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

    
    //MARK:-> test of result date base on internet connection
    func testNetowrk() {
        let expectation = XCTestExpectation.init(description: "Network expectation")
        NetworkHandler.getJsonArrayResponse(NetworkRouter.ListRepo, success: { (array) in
            let arr = array as? [[String: Any]]
            let repos = arr?.map { RepoModel.init(dict: $0) }
            if (repos?.count ?? 0) > 0 {
                expectation.fulfill()
            }
        }) { (error) in
            XCTFail("Fail")
        }
        self.wait(for: [expectation], timeout: 20)
    }
    
    
    
    func testGetRepoDataFetch() {
        let expectation = XCTestExpectation.init(description: "Get Repos expectation")
        NetworkHandler.getJsonArrayResponse(NetworkRouter.ListRepo, success: { (array) in
            let arr = array as? [[String: Any]]
            let repos = arr?.map { RepoModel.init(dict: $0) } ?? []
            if repos.count > 0 {
                
                let repo = repos.first
                if let name = repo?.name ,
                    let repoURL = repo?.html_url ,
                    let owner = repo?.owner ,
                    let imageOwner = owner.avatar_url ,
                    let owneeRepoURL = owner.html_url {
                    
                    expectation.fulfill()
                    
                }else {
                    XCTFail("Data not fetched")

                }
                
            }else {
                XCTFail("Fail")
            }

        }){ (error) in
            XCTFail("Fail")
        }
        self.wait(for: [expectation], timeout: 20)

    }
    
    
    //MARK:-> test of result date base on current Data
    func testDateFormat() {
        let res = "2010-12-01".getDatePeriodString(format: "yyyy-MM-dd")
        XCTAssert(res == "10 Year ago", "Error on Date Period")
        let res2 = "2010-01-01".getDatePeriodString(format: "yyyy-MM-dd")
        XCTAssert(res2 == "10 Year ago", "Error on Date Period")
        let res3 = "2020-10-01".getDatePeriodString(format: "yyyy-MM-dd")
        XCTAssert(res3 == "2 Month ago", "Error on Date Period")
        
        let res4 = "2020-09-01".getFomatDate(format: "yyyy-MM-dd")
        XCTAssert(res4 == "3 Month ago", "Error on Date Period")
        let res5 = "2020-01-01".getFomatDate(format: "yyyy-MM-dd")
        XCTAssert(res5?.contains("ago") == false, "Error on Date Period")
    }
    
    
    
    
    func setupDataList() -> [RepoModel] {
        var list = [RepoModel]()
        let item1 = RepoModel.init()
        item1.name = "grit"
        let item11 = RepoModel.init()
        item11.name = "grbt"
        let item111 = RepoModel.init()
        item111.name = "gribt"
        let item2 = RepoModel.init()
        item2.name = "merb-core"
        let item3 = RepoModel.init()
        item3.name = "jspec-rban"
        list.append(item1)
        list.append(item11)
        list.append(item111)
        list.append(item2)
        list.append(item3)
        return list
    }
    
    func testListPresenter() {
        let list = setupDataList()
        let presenter = ListScreenPresenter.init(GetListView: nil)
        presenter.cacheList = list
        presenter.list = list
        let res = presenter.search(text: "gri")
        XCTAssert((res?.count ?? 0) == 2, "Error")
        let res2 = presenter.search(text: "gr")
        XCTAssert((res2?.count ?? 0) == 3, "Error")
        let res3 = presenter.search(text: "rb") //grbt // merb // jspec-rban
        XCTAssert((res3?.count ?? 0) == 3, "Error")
        let res4 = presenter.search(text: "jspec") //grbt // merb // jspec-rban
        XCTAssert((res4?.count ?? 0) == 1, "Error")
    }
    
    
    func testImageLoad() {
        //Ex1
        let expectation = XCTestExpectation.init(description: "Get Image expectation")
        let imageURL = "https://avatars0.githubusercontent.com/u/1?v=4"
        let img = UIImageView.init()
        img.loadImage(fromURL: imageURL) { (image) in
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 12)
        print("test")
        //Ex 2
        let expectation2 = XCTestExpectation.init(description: "Get Cache Image expectation")
        let img2 = UIImageView.init()
        img2.loadImage(fromURL: imageURL) { (image) in
            expectation2.fulfill()
        }
        self.wait(for: [expectation2], timeout: 3)
       
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
