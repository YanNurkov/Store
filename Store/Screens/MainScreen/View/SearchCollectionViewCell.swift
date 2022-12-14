//
//  SearchCollectionViewCell.swift
//  Store
//
//  Created by Ян Нурков on 05.12.2022.
//

import UIKit
import SnapKit
import Foundation

class SearchCollectionViewCell: UICollectionViewCell {
    static let cellSearchIdentifier = "cellSearch"
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    //MARK: Functions
    private func setupHierarchy() {
        addSubview(searchBar)
        addSubview(button)
        searchBar.addSubview(imageSearch)
    }
    
    private func setupLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-60)
            make.height.equalTo(34)
        }
        
        button.snp.makeConstraints { make in
            make.left.equalTo(searchBar.snp.right).offset(11)
            make.top.equalTo(self)
            make.width.equalTo(34)
        }
        
        imageSearch.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(9)
            make.height.width.equalTo(17.5)
        }
    }
    
    //MARK: Elements
    lazy var searchBar: UITextField = {
        let obj = UITextField()
        obj.placeholder = "Search "
        obj.font = UIFont(name: "MarkPro-Regular", size: 12)
        obj.sizeToFit()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 17
        obj.backgroundColor = .white
        obj.indent(size: 45)
        return obj
    }()
    
    lazy var imageSearch: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .scaleAspectFit
        obj.clipsToBounds = true
        obj.image = UIImage(systemName: "magnifyingglass")
        obj.tintColor = Colors.orange
        return obj
    }()
    
    lazy var button: UIButton = {
        let obj = UIButton()
        obj.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
        obj.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2).cgColor
        obj.layer.borderWidth = 1
        obj.layer.cornerRadius   = 17
        obj.clipsToBounds        = true
        obj.setImage(UIImage(named: "qr"), for: .normal)
        return obj
    }()
}

//MARK: Extension
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
