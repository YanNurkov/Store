//
//  CartTableViewDataSource.swift
//  Store
//
//  Created by Ян Нурков on 13.12.2022.
//

import Foundation
import UIKit

class CartTableViewDataSource<CELL : UITableViewCell, T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items: [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    //MARK: Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        cell.selectionStyle = .none
        self.configureCell(cell, item)
        return cell
        
    }
    
}


