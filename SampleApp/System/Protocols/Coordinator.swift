//
//  Coordinator.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import UIKit

protocol Coordinator {
    associatedtype InputData
    
    var rootViewController: UIViewController? { get }

    func start(with viewController: UIViewController, inputData: InputData?)
}
