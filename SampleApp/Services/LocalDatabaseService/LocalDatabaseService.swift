//
//  LocalDatabaseService.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation

protocol LocalDatabaseService {
    func fetchAllItems() -> [ItemModel]
    func addItem(code: String, type: String) -> Error?
}
