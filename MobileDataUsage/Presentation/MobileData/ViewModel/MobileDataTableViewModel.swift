//
//  MobileDataTableViewModel.swift
//  MobileDataUsage
//
//  Created by Weidian on 15/1/20.
//  Copyright © 2020 sph. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MobileDataTableViewModel: ViewModelType {
    
    struct Input {
        let ready: Driver<Void>
    }
    
    struct Output {
        let mobileDataItems: Driver<[MobileDataTableItemViewModel]>
    }
    
    init() {
    }
    
    func transform(input: MobileDataTableViewModel.Input?) -> MobileDataTableViewModel.Output {
        let repository = DefaultMobileDataRepository(apiService: NetworkApi(), storage: UserDefaultsStorage())
        
        let mobileDataViewModels = repository
            .mobileDataDrive()
            .asDriver(onErrorJustReturn: [])
            .map { $0.map {
                MobileDataTableItemViewModel( $0.year, $0.volume.description, $0.dropped)
            } }
        
        return Output(mobileDataItems: mobileDataViewModels)
    }
}

