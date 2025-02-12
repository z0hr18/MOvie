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
        // Burada HomeCoordinator və ya ilk ekran başladılacaq
    }
}

