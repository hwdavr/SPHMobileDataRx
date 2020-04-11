//
//  NetworkApiModule.swift
//  MobileDataUsage
//
//  Created by Huang Weidian on 10/4/20.
//  Copyright © 2020 sph. All rights reserved.
//

import DIKit

public extension DependencyContainer {
    static var api = module {
        // Inject new instance 
        single { NetworkApi() as NetworkService }
    }
}
