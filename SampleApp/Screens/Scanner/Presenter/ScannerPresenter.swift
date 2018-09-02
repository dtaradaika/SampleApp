//
//  ScannerPresenter.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit

class ScannerPresenter {
    let coordinator: ScannerCoordinatorInput
    let localDatabaseService: LocalDatabaseService

    init(coordinator: ScannerCoordinatorInput, localDatabaseService: LocalDatabaseService) {
        self.coordinator = coordinator
        self.localDatabaseService = localDatabaseService
    }
}

extension ScannerPresenter: ScannerViewOutput {
    func scanned(view: ScannerViewInput, code: String, type: String) {
        if let error = localDatabaseService.addItem(code: code, type: type) {
            coordinator.showAlert(title: NSLocalizedString("Error", comment: "Error"), message: error.localizedDescription)
        }else {
            coordinator.closeScanner()
        }
    }
    
    func scannedError(view: ScannerViewInput, error: String) {
        coordinator.showAlert(title: NSLocalizedString("Error", comment: "Error"), message: error)
    }
    
    func scannerClose(view: ScannerViewInput) {
        coordinator.closeScanner()
    }
}

