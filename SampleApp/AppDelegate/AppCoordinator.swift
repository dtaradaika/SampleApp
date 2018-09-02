//
//  AppCoordinator.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    func start() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = UINavigationController()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start(with: mainViewController, inputData: nil)
        
        return window
    }
}
