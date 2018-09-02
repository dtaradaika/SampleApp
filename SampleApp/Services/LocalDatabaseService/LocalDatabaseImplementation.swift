//
//  LocalDatabaseServiceImplementation.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import RealmSwift

class LocalDatabaseImplementation: LocalDatabaseService {
    
    lazy var realm = try Realm()
    
    func fetchAllItems() -> [ItemModel] {
        let items = realm.objects(ItemModel.self)
        return Array(items)
    }
    
    func addItem(code: String, type: String) -> Error? {
        let item = ItemModel()
        item.code = code
        item.type = type
        
        do {
            try realm.write {
                realm.add(item)
            }
        }catch let error {
            return error
        }
        
        return nil
    }
}
