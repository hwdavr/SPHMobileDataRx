//
//  RepositoryModule.swift
//  MobileDataUsage
//
//  Created by Huang Weidian on 10/4/20.
//  Copyright © 2020 sph. All rights reserved.
//

import DIKit

public extension DependencyContainer {
    static var repository = module {
        // Inject as singleton 
        single { UserDefaultsStorage() as MobileDataStorage }
    }
}
