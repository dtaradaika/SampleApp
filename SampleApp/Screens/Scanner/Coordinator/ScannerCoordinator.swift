//
//  ScannerCoordinator.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit

class ScannerCoordinator: Coordinator, ScannerCoordinatorInput {
   
    weak var rootViewController: UIViewController?
    
    func start(with viewController: UIViewController, inputData: Any?) {
        let localDatabase = LocalDatabaseImplementation()
        let presenter = ScannerPresenter(coordinator: self, localDatabaseService: localDatabase)
        let scannerViewController = ScannerViewController(eventHandler: presenter)
        
        viewController.present(scannerViewController, animated: true, completion: nil)
        
        rootViewController = scannerViewController
    }
    
    func closeScanner() {
        rootViewController?.dismiss(animated: true, completion: nil)
    }
}
