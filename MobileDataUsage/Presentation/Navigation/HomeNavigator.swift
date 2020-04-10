//
//  HomeNavigator.swift
//  MobileDataUsage
//
//  Created by Huang Weidian on 10/4/20.
//  Copyright © 2020 sph. All rights reserved.
//

import UIKit

class HomeNavigator: BaseNavigator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MobileDataTableViewController.build()
        self.navigationController.viewControllers.append(viewController)
    }

    func next(state: Any?) {
        // Navigator to next screen
    }
}

