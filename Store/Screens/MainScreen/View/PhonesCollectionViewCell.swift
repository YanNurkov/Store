//
//  PhonesCollectionViewCell.swift
//  Store
//
//  Created by Ян Нурков on 08.12.2022.
//

import Foundation
import UIKit
import SnapKit

class PhonesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Phones"
    
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
        addSubview(name)
        addSubview(newPrice)
        image.addSubview(buttonLike)
        addSubview(lastPrice)
        lastPrice.addSubview(line)
        backgroundColor = .white
        layer.cornerRadius = 15
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-35)
        }
        
        name.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(13)
        }
        
        newPrice.snp.makeConstraints { make in
            make.bottom.equalTo(name.snp.top).offset(-5)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(17)
        }
        
        buttonLike.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(6)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        lastPrice.snp.makeConstraints { make in
            make.left.equalTo(newPrice.snp.right).offset(7)
            make.height.equalTo(11)
            make.bottom.equalTo(newPrice.snp.bottom)
            make.width.equalTo(30)
        }
        
        line.snp.makeConstraints { make in
            make.height.equalTo(0.3)
            make.left.right.equalToSuperview()
            make.centerY.equalTo(lastPrice.snp.centerY)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = buttonLike.hitTest(buttonLike.convert(point, from: self), with: event)
        if view == nil {
            view = super.hitTest(point, with: event)
        }
        
        return view
    }
    
    @objc func touch() {
        if tab == false {
            tab = true
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            tab = false
            buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    //MARK: Elements
    var tab: Bool = false
    
    lazy var image: UIImageView = {
        let obj = UIImageView()
        obj.layer.cornerRadius = 15
        return obj
    }()
    
    lazy var name: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 11)
        obj.textColor = Colors.blue
        return obj
    }()
    
    lazy var newPrice: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Bold", size: 16)
        obj.textColor = Colors.blue
        return obj
    }()
    
    lazy var lastPrice: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Medium", size: 10)
        obj.textColor = .gray
        return obj
    }()
    
    lazy var line: UIView = {
        let obj = UIView()
        obj.backgroundColor = .lightGray
        return obj
    }()
    
    lazy var buttonLike: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 17.5
        obj.addTarget(self, action: #selector(touch), for: .touchDown)
        obj.setImage(UIImage(systemName: "heart"), for: .normal)
        obj.tintColor = Colors.orange
        obj.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        obj.layer.shadowOpacity = 4
        obj.layer.shadowRadius = 20
        obj.layer.shadowOffset = CGSize(width: 0, height: 0)
        return obj
    }()
}
