//
//  DefaultMobileDataRepoTest.swift
//  MobileDataUsageTests
//
//  Created by Huang Weidian on 11/4/20.
//  Copyright © 2020 sph. All rights reserved.
//
@testable import MobileDataUsage
import XCTest
import DIKit

class DefaultMobileDataRepoTest: XCTestCase {
    var repo: DefaultMobileDataRepository? = nil
    
    override class func setUp() {
        super.setUp()
        // Called once before all tests are run
    }
    
    override func setUp() {
        repo = DefaultMobileDataRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let expect = expectation(description: "")
        repo?.mobileDataDrive()
            .asDriver()
            .asObservable()
            .subscribe(onNext: { (mobileData) in
                XCTAssertTrue(mobileData.count > 0)
                expect.fulfill()
            })
        wait(for: [expect], timeout: 10.0)
    }

}
