//
//  HomeCoordinator.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator, HomeCoordinatorInput {
   
    weak var rootViewController: UIViewController?
    
    func start(with viewController: UIViewController, inputData: Any?) {
        
        let localDatabase = LocalDatabaseImplementation()
        let presenter = HomePresenter(coordinator: self, localDatabaseService: localDatabase)
        let homeViewController = HomeViewController(datasource: presenter, eventHandler: presenter)
        
        if let navigation = viewController as? UINavigationController {
            navigation.viewControllers = [homeViewController]
        }else {
            let container = UINavigationController(rootViewController: homeViewController)
            viewController.show(container, sender: nil)
        }
        
        rootViewController = homeViewController
    }
    
    func scanItem() {
        guard let rootViewController = rootViewController else {
            return
        }
        
        let scannerCoordinator = ScannerCoordinator()
        scannerCoordinator.start(with: rootViewController, inputData: nil)
    }
}
