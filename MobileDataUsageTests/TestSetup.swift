//
//  File.swift
//  MobileDataUsageTests
//
//  Created by Huang Weidian on 11/4/20.
//  Copyright © 2020 sph. All rights reserved.
//
import DIKit

class TestSetup: NSObject {
    override init() {
        DependencyContainer.defined(by: modules {
            DependencyContainer.viewModel
            DependencyContainer.api
            DependencyContainer.repository
        })
    }
}
