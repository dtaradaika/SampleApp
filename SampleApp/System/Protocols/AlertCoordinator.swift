//
//  AlertCoordinator.swift
//  SampleApp
//
//  Created by dire on 9/3/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import UIKit

protocol AlertsCoordinator {
    /// shows alert controller with given title and message
    func showAlert(title: String, message: String)
}

extension AlertsCoordinator where Self: Coordinator {
    func showAlert(title: String, message: String) {
        guard let root = rootViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        root.present(alert, animated: true, completion: nil)
    }
}
