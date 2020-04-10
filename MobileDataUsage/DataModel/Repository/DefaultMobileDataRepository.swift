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
import DIKit

class DefaultMobileDataRepository {
    @Inject var apiService: NetworkService
    @Inject var storage: MobileDataStorage


    func mobileDataDrive() -> SharedSequence<DriverSharingStrategy, [YearMobileData]> {
        let storedMobileData = storage.reactiveMobileData().asDriver(onErrorJustReturn: [])
        
        return apiService
            .fetchMobileData()
            .asDriver(onErrorDriveWith: storedMobileData)
    }
}
