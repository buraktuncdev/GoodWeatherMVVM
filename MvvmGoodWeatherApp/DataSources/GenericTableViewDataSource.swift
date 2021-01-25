//
//  GenericTableViewDataSource.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 25.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit

// MARK: Generic Table View Data Source For MVVM

class GenericTableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    
    let cellIdentifier: String
    var items: [ViewModel] // MARK: we are actually passing items as an array. When we try to add a new item from the VC side is a problem. (Investigate--How to fix thah problem!!)
    let configureCell: (CellType, ViewModel) -> () // MARK: closure accessing to cell and customize cell appearance
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Cell Identifier: \(self.cellIdentifier) not found")
        }
        
        let viewModel = self.items[indexPath.row]
        self.configureCell(cell, viewModel)
        return cell
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
    
}
