//
//  CollectionViewDataSource.swift
//  Store
//
//  Created by Ян Нурков on 09.12.2022.
//

import Foundation
import UIKit

class CollectionViewDataSource<CELL : UICollectionViewCell, CELL2 : UICollectionViewCell, T, G> : NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var cellIdentifier1 : String!
    private var cellIdentifier2 : String!
    private var items1: [T]!
    private var items2: [G]!
    var configureCell1 : (CELL, T) -> () = {_,_ in }
    var configureCell2 : (CELL2, G) -> () = {_,_ in }
    var models: [Sections] = Sections.getSections()
    var likeStatus = true
    
    init(cellIdentifier1: String, cellIdentifier2 : String, items1: [T], items2: [G], configureCell1: @escaping (CELL, T) -> (), configureCell2: @escaping (CELL2, G) -> ()) {
        self.cellIdentifier1 = cellIdentifier1
        self.cellIdentifier2 = cellIdentifier2
        self.items1 =  items1
        self.items2 = items2
        self.configureCell1 = configureCell1
        self.configureCell2 = configureCell2
    }
    
    //MARK: Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }
        if section == 1 {
            return 1
        }
        if section == 2 {
            return 3
        }
        if section == 3 {
            return 4
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[0].settings[indexPath.item]
        switch indexPath.section {
        case 0:
            switch model {
            case .buttonCell(let model):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionButtonViewCell.reduseID, for: indexPath) as? CollectionButtonViewCell else {
                    return UICollectionViewCell()
                }
                let vc = ViewController()
                if indexPath.row == 0 {
                    
                    vc.lastSelectedIndexPath = indexPath
                    cell.isSelected = true
                }
                
                cell.isSelected = (vc.lastSelectedIndexPath == indexPath)
                cell.configuration(model: model)
                
                return cell
            }
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.cellSearchIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell()
            }
            return cell
        case 2:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier1, for: indexPath) as! CELL
            let item = self.items1[indexPath.row]
            self.configureCell1(cell, item)
            
            return cell
            
        case 3:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier2, for: indexPath) as! CELL2
            let item = self.items2[indexPath.row]
            self.configureCell2(cell, item)
            return cell
            
        default:
            return CELL()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableView.cellHeaderIdentifier, for: indexPath) as? CollectionReusableView else {
            return UICollectionReusableView()
        }
        switch indexPath.section {
        case 0:
            header.configuration(headerLeftTitle: "Select Category", headerRightTitle: "view all")
        case 1:
            header.configuration(headerLeftTitle: "", headerRightTitle: "")
        case 2:
            header.configuration(headerLeftTitle: "Hot Sales", headerRightTitle: "see more")
        case 3:
            header.configuration(headerLeftTitle: "Best Seller", headerRightTitle: "see more")
        default:
            header.configuration(headerLeftTitle: "Title", headerRightTitle: "title")
        }
        return header
    }
    
    @objc func pushLike(sender: UIButton) {
        if likeStatus == false {
            likeStatus = true
            print(sender.tag)
        }
        if likeStatus == true {
            likeStatus = false
            print(sender.tag)
        }
    }
}


