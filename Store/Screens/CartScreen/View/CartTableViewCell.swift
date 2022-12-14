//
//  CartTableViewCell.swift
//  Store
//
//  Created by Ян Нурков on 13.12.2022.
//

import UIKit
import SnapKit
import SDWebImage

class CartTableViewCell: UITableViewCell {
    
    static let reduseID = "CartTableViewCell"
    
    //MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseID: String?) {
        super.init(style: style, reuseIdentifier: reuseID)
        image.clipsToBounds = true
        setupHierarchy()
        makeConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    //MARK: Functions
    
    private func setupHierarchy() {
        backgroundColor = Colors.blue
        addSubview(self.image)
        addSubview(self.nameLabel)
        addSubview(self.pricePhoneLabel)
        addSubview(self.viewButton)
        viewButton.addSubview(viewMinus)
        viewButton.addSubview(viewNmber)
        viewButton.addSubview(viewPlus)
        addSubview(self.bin)
    }
    
    func makeConstraint() {
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(23)
            make.width.equalTo(95)
            make.height.equalTo(111)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(9)
            make.top.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(156)
        }
        
        pricePhoneLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.width.equalTo(110)
            make.height.equalTo(25)
        }
        
        viewButton.snp.makeConstraints { make in
            make.width.equalTo(28)
            make.height.equalTo(70)
            make.right.equalToSuperview().offset(-64)
            make.centerY.equalTo(image.snp.centerY)
        }
        
        viewMinus.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(3)
            make.top.equalToSuperview().offset(14)
        }
        
        viewNmber.snp.makeConstraints { make in
            make.centerX.equalTo(viewButton.snp.centerX)
            make.centerY.equalTo(viewButton.snp.centerY)
            make.height.equalTo(25)
            
        }
        
        viewPlus.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(9)
            make.bottom.equalToSuperview().offset(-10)
            
        }
        
        bin.snp.makeConstraints { make in
            make.width.equalTo(23)
            make.height.equalTo(23)
            make.right.equalToSuperview().offset(-23)
            make.centerY.equalTo(viewButton.snp.centerY)
        }
        
    }
    
    //MARK: Elements
    
    lazy var image: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "pizza1")
        obj.layer.cornerRadius = 15
        return obj
    }()
    
    lazy var nameLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 2
        obj.text = "GALAXY NOTE 20 ULTRA"
        obj.font = UIFont(name: "MarkPro-Medium", size: 20)
        obj.textColor = .white
        return obj
    }()
    
    lazy var pricePhoneLabel : UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Medium", size: 20)
        obj.text = "1000"
        obj.textColor = Colors.orange
        return obj
    }()
    
    lazy var viewButton: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(red: 0.158, green: 0.156, blue: 0.262, alpha: 1)
        obj.layer.cornerRadius = 13
        return obj
    }()
    
    lazy var viewMinus: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(systemName: "minus"), for: .normal)
        obj.tintColor = .white
        return obj
    }()
    
    lazy var viewNmber: UILabel = {
        let obj = UILabel()
        obj.text = "2"
        obj.textColor = .white
        obj.font = UIFont(name: "MarkPro-Medium", size: 20)
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var viewPlus: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(systemName: "plus"), for: .normal)
        obj.tintColor = .white
        return obj
    }()
    
    lazy var bin: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: "bin"), for: .normal)
        obj.tintColor = .white
        return obj
    }()
    
}
