//
//  CollectionButtonViewCell.swift
//  Store
//
//  Created by Ян Нурков on 05.12.2022.
//

import Foundation
import UIKit
import SnapKit

class CollectionButtonViewCell: UICollectionViewCell {
    static let reduseID = "CollectionViewCell"
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.clipsToBounds = true
        setupHierarchy()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    //MARK: Functions
    func setupHierarchy() {
        addSubview(image)
        image.addSubview(button)
        addSubview(label)
    }
    
    func buttonUpdate() {
        button.backgroundColor = .white
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = nil
    }
    
    func configuration(model: SettingsButton) {
        button.image = model.image
        label.text = model.name
    }
    
    override var isSelected: Bool {
        didSet {
            image.image =
            isSelected ? UIImage(named: "orange") : UIImage()
        }
    }
    
    func makeConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(71)
            make.width.equalTo(71)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(71)
            make.width.equalTo(71)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(button.snp.left)
            make.right.equalTo(button.snp.right)
            make.top.equalTo(button.snp.bottom).offset(5)
            make.height.equalTo(15)
        }
        
    }
    
    //MARK: Elements
    lazy var button: UIImageView = {
        let obj = UIImageView()
        obj.backgroundColor = .clear
        obj.layer.cornerRadius   = 35.5
        obj.clipsToBounds        = true
        return obj
    }()
    
    lazy var image: UIImageView = {
        let obj = UIImageView()
        obj.backgroundColor = .white
        obj.layer.cornerRadius   = 35.5
        obj.clipsToBounds        = true
        return obj
    }()
    
    var label: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Medium", size: 12)
        obj.textAlignment = .center
        return obj
    }()
}
