//
//  DefaultMobileDataRepository.swift
//  MobileDataUsage
//
//  Created by Weidian on 27/1/20.
//  Copyright © 2020 sph. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DefaultMobileDataRepository {
    private let apiService: NetworkService!
    private let storage: MobileDataStorage!
    
    init(apiService: NetworkService, storage: MobileDataStorage) {
        self.apiService = apiService
        self.storage = storage
    }
    
    func mobileDataDrive() -> SharedSequence<DriverSharingStrategy, [YearMobileData]> {
        let storedMobileData = storage.reactiveMobileData().asDriver(onErrorJustReturn: [])
        
        return apiService
            .fetchMobileData()
            .asDriver(onErrorDriveWith: storedMobileData)
    }
}
