//
//  ScannerViewController.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit
import BarcodeScanner

class ScannerViewController<EventsHandler>: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate, ScannerViewInput where EventsHandler: ScannerViewOutput{
 
    var scannerViewController: BarcodeScannerViewController!
    let eventHandler: EventsHandler
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBarcodeScanner()
    }
    
    init(eventHandler: EventsHandler) {
       
        self.eventHandler = eventHandler
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    
    private func setupBarcodeScanner() {
        
        scannerViewController = BarcodeScannerViewController()
        scannerViewController.codeDelegate = self
        scannerViewController.errorDelegate = self
        scannerViewController.dismissalDelegate = self
        
        scannerViewController.willMove(toParentViewController: self)
        addChildViewController(scannerViewController)
        scannerViewController.didMove(toParentViewController: self)
        
        view.addSubview(scannerViewController.view)
        
        scannerViewController.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    // MARK: - Scanner Delegate
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        eventHandler.scanned(view: self, code: code, type: type)
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        eventHandler.scannedError(view: self, error: error.localizedDescription)
    }
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        eventHandler.scannerClose(view: self)
    }
}

