//
//  HomeViewController.swift
//  SampleApp
//
//  Created by dire on 9/2/18.
//  Copyright © 2018 Dmytro Taradaika. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController<Datasource, EventsHandler> : UIViewController, UITableViewDelegate, UITableViewDataSource where
    Datasource: HomeListDataSource,
EventsHandler: HomeViewOutput {
    
    let dataSource: Datasource
    unowned let eventHandler: EventsHandler
    
    private var tableView: UITableView!
    
    init(datasource: Datasource, eventHandler: EventsHandler) {
        self.dataSource = datasource
        self.eventHandler = eventHandler
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler.viewRequireData(self)
    }
    
    // MARK: - Table View DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItems(in: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.item(at: indexPath)
        let cell: HomeItemCell = tableView.retrieveReusableItem(for: indexPath)
        cell.setup(item: item)
        return cell
    }
    
    // MARK: - Actions
    
    @objc func scannButtonAction() {
        eventHandler.tapOnScan(view: self)
    }
    
    // MARK: -  Private functions
    
    func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerReusableNib(HomeItemCell.self)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupNavigationBar() {
        let scanButton = UIBarButtonItem(image: UIImage(named: "scanImage"), style: .plain, target: self, action: #selector(scannButtonAction))
        navigationItem.rightBarButtonItem = scanButton
        title = NSLocalizedString("Bucket", comment: "Bucket")
    }
}

extension HomeViewController: ListViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}
