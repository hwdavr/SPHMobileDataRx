//
//  MainCoordinator.swift
//  MobileDataUsage
//
//  Created by Huang Weidian on 10/4/20.
//  Copyright © 2020 sph. All rights reserved.
//
//  Refer to: https://www.raywenderlich.com/158-coordinator-tutorial-for-ios-getting-started

import UIKit

class MainCoordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    var deepLink: URL?
    var currentNavigator: BaseNavigator?
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        if #available(iOS 11.0, *) {
            rootViewController.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        currentNavigator = HomeNavigator(navigationController: rootViewController)
        currentNavigator?.start()
    }
}

