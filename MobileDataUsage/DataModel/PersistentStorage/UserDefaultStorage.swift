//
//  UserDefaultStorage.swift
//  MobileDataUsage
//
//  Created by Weidian on 27/1/20.
//  Copyright © 2020 sph. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class UserDefaultsStorage: MobileDataStorage {
    private let mobileDataQueriesKey = "mobileDataQueries"
    private var userDefaults: UserDefaults { return UserDefaults.standard }
    
    func saveMobileData(mobileData: YearMobileDataResults) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(mobileData) {
            userDefaults.set(encoded, forKey: mobileDataQueriesKey)
        }
    }
    
    func reactiveMobileData() -> Observable<[YearMobileData]> {
        userDefaults.rx
            .observe(Data.self, mobileDataQueriesKey)
            .map { data -> [YearMobileData] in
                guard let queryData = data else {
                    return []
                }
                let decoder = JSONDecoder()
                if let result = try? decoder.decode(YearMobileDataResults.self, from: queryData) {
                    return result.records
                }
                return []
            }
    }
}

