//
//  HotSalesCollectionCell.swift
//  Store
//
//  Created by Ян Нурков on 05.12.2022.
//

import Foundation
import UIKit
import SnapKit

class HotSalesCollectionCell: UICollectionViewCell {
    
    static let identifier = "HotSales"
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        image.clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    //MARK: Functions
    private func setupHierarchy() {
        addSubview(image)
        image.addSubview(nameItem)
        image.addSubview(about)
        image.addSubview(buttonBuy)
        image.addSubview(new)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.height.equalTo(self)
            make.width.equalTo(self)
        }
        
        nameItem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(69)
            make.left.equalToSuperview().offset(22)
            make.width.equalTo(129)
            make.height.equalTo(30)
        }
        
        about.snp.makeConstraints { make in
            make.top.equalTo(nameItem.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(22)
            make.width.equalTo(120)
            make.height.equalTo(13)
        }
        
        buttonBuy.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(22)
            make.bottom.equalToSuperview().offset(-24)
            make.width.equalTo(98)
            make.height.equalTo(23)
        }
        
        new.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(25)
            make.width.height.equalTo(27)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    //MARK: Elements
    lazy var image: UIImageView = {
        let obj = UIImageView()
        obj.layer.cornerRadius = 20
        return obj
    }()
    
    lazy var nameItem: UILabel = {
        let obj = UILabel()
        obj.font = .boldSystemFont(ofSize: 25)
        obj.textColor = .white
        return obj
    }()
    
    lazy var about: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 11)
        obj.textColor = .white
        return obj
    }()
    
    lazy var buttonBuy: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 5
        obj.setTitleColor(.black, for: .normal)
        obj.titleLabel?.font = .boldSystemFont(ofSize: 11)
        obj.setTitle("Buy now!", for: .normal)
        return obj
    }()
    
    lazy var new : UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "new")
        obj.isHidden = true
        return obj
    }()
    
    var employee : HomeStore? {
        didSet {
            nameItem.text = employee?.title
            about.text = employee?.subtitle
            image.sd_setImage(with: URL(string: String((employee?.picture)!)), placeholderImage: UIImage(named: "pizza1"))
        }
    }
}
