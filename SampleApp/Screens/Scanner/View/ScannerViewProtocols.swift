//
//  ScannerViewProtocols.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation

protocol ScannerViewInput {
    
}

protocol ScannerViewOutput: class {
    func scanned(view: ScannerViewInput, code: String, type: String)
    func scannedError(view: ScannerViewInput, error: String)
    func scannerClose(view: ScannerViewInput)
}
