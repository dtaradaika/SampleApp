//
//  HomeViewProtocols.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation

protocol HomeListDataSource: ListDatasource where Element == ItemModel  {
    
}


protocol HomeViewOutput: ListViewOutput where View == ListViewInput {
    func tapOnScan(view: View)
}
