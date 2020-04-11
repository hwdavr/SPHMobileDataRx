//
//  UserDefaultStorageTest.swift
//  MobileDataUsageTests
//
//  Created by Huang Weidian on 10/4/20.
//  Copyright © 2020 sph. All rights reserved.
//

@testable import MobileDataUsage
import XCTest
import RxBlocking
import RxSwift
import DIKit

class UserDefaultStorageTest: XCTestCase {
    var storage: UserDefaultsStorage? = nil
    let disposeBag = DisposeBag()
    
    override class func setUp() {
        super.setUp()
        // Called once before all tests are run

    }

    override func setUp() {
        storage = UserDefaultsStorage()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let results = YearMobileDataResults(from: [
            YearMobileData("2010", 0.1, false),
            YearMobileData("2011", 0.2, false),
            YearMobileData("2012", 1.1, false),
            YearMobileData("2013", 2.1, false)
        ])
        storage?.saveMobileData(mobileData: results)
        let rxData = storage?.reactiveMobileData()
        rxData?.subscribe(onNext: { (mobileData) in
            XCTAssertTrue(mobileData.count == 4)
            }).disposed(by: disposeBag)
        
    }

}
