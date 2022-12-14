//
//  ProductCollectionViewDataSource.swift
//  Store
//
//  Created by Ян Нурков on 12.12.2022.
//

import Foundation
import UIKit
import SnapKit

class ProductCollectionViewDataSource<CELL : UICollectionViewCell, T> : NSObject, UICollectionViewDataSource {
    
    private var cellIdentifier : String!
    private var items: [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    var likeStatus = true
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    //MARK: Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        for i in items {
            let item = i
            self.configureCell(cell, item)
        }
        return cell
    }
}


