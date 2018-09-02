//
//  Reusable.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}

// Adding support of IMGReusable to most common UI classes

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}

extension UITableView {
    func registerReusableView<T>(_ type: T.Type) where T: Reusable {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerReusableNib<T>(_ type: T.Type) where T: Reusable {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func retrieveReusableItem<T>() -> T where T: Reusable {
        if let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T {
            return cell
        }
        fatalError("reusable item of type \(T.self) was not registered with a tableView: \(self)")
    }
    
    func retrieveReusableItem<T>(for indexPath: IndexPath) -> T where T: Reusable {
        if let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T {
            return cell
        }
        fatalError("reusable item of type \(T.self) was not registered with a tableView: \(self)")
    }
    
    func registerReusableAccessoryView<T>(_ type: T.Type) where T: Reusable {
        register(type, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerReusableAccessoryNib<T>(_ type: T.Type) where T: Reusable {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    func retieveReuableAccessoryView<T>() -> T where T: Reusable {
        if let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T {
            return view
        }
        fatalError("reusable item of type \(T.self) was not registered with a tableView: \(self)")
    }
}
