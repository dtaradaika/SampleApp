//
//  ListDataSource.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import UIKit

protocol ListDatasource {
    associatedtype Element
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at index: IndexPath) -> Element
}

protocol ListViewInput {
    func reloadData()
}

protocol ListViewOutput: class {
    associatedtype View = ListViewInput
    
    func viewRequireData(_ view: View)
    func view(_ view: View, willDisplayItemAt index: IndexPath)
    func view(_ view: View, didSelectItemAt index: IndexPath)
}
