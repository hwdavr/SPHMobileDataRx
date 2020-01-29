//
//  MobileDataStorage.swift
//  MobileDataUsage
//
//  Created by Weidian on 27/1/20.
//  Copyright © 2020 sph. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MobileDataStorage {
    func reactiveMobileData() -> Observable<[YearMobileData]>
    func saveMobileData(mobileData: YearMobileDataResults)
}
