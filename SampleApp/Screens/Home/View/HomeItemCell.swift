//
//  HomeItemCell.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit

class HomeItemCell: UITableViewCell {
    
    @IBOutlet var itemCode: UILabel!
    @IBOutlet var itemType: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemCode.text = nil
        itemType.text = nil
    }
    
    func setup(item: ItemModel) {
        itemCode.text = item.code
        itemType.text = item.type
    }
}
