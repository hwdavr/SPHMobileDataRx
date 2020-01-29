//
//  NetworkApiTest.swift
//  MobileDataUsageTests
//
//  Created by Weidian on 27/1/20.
//  Copyright © 2020 sph. All rights reserved.
//

import XCTest
import RxBlocking

class NetworkApiTest: XCTestCase {
    let api = NetworkApi()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchMobileData() {
        let mobileData = try? api.fetchMobileData().toBlocking().first()
        print(mobileData)
    }

}
