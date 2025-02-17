//
//  Coordinator.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 09.02.25.
//

import Foundation
import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
