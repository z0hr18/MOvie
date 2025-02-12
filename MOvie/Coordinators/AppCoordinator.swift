//
//  AppCoordinator.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 10.02.25.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [createHomeNavigationController(),
                                            createSearchNavigationController(),
                                            createWatchListNavigationController()]
        
        UITabBar.appearance().tintColor = UIColor(named: "0296E5")
        tabBarController.tabBar.backgroundColor = UIColor(named: "242A32")
        
        navigationController.viewControllers = [tabBarController]
    }

    // Home Tab üçün Naviqasiya
    func createHomeNavigationController() -> UINavigationController {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        return UINavigationController(rootViewController: homeViewController)
    }

    // Search Tab üçün Naviqasiya
    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        return UINavigationController(rootViewController: searchViewController)
    }

    // Watch List Tab üçün Naviqasiya
    func createWatchListNavigationController() -> UINavigationController {
        let watchListViewController = WatchListViewController()
        watchListViewController.tabBarItem = UITabBarItem(title: "Watch List", image: UIImage(systemName: "bookmark"), tag: 2)
        return UINavigationController(rootViewController: watchListViewController)
    }
}

