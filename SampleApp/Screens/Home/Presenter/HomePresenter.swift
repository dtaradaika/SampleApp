//
//  HomePresenter.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter {
    let coordinator: HomeCoordinatorInput
    let localDatabaseService: LocalDatabaseService
    
    private var items: [ItemModel] = []
    
    init(coordinator: HomeCoordinatorInput, localDatabaseService: LocalDatabaseService) {
        self.coordinator = coordinator
        self.localDatabaseService = localDatabaseService
    }
}


extension HomePresenter: HomeListDataSource {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func item(at index: IndexPath) -> ItemModel {
        return items[index.row]
    }
}

extension HomePresenter: HomeViewOutput {
    func tapOnScan(view: ListViewInput) {
        coordinator.scanItem()
    }
    
    func viewRequireData(_ view: ListViewInput) {
        self.items = localDatabaseService.fetchAllItems()
        view.reloadData()
    }
    
    func view(_ view: ListViewInput, willDisplayItemAt index: IndexPath) {
        
    }
    
    func view(_ view: ListViewInput, didSelectItemAt index: IndexPath) {
        
    }
}
