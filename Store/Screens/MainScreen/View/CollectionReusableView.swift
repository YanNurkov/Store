//
//  CollectionReusableView.swift
//  Store
//
//  Created by Ян Нурков on 05.12.2022.
//

import Foundation
import UIKit
import SnapKit

class CollectionReusableView: UICollectionReusableView {
    
    static let cellHeaderIdentifier = "cellHeader"
    
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
        addSubview(leftTitle)
        addSubview(rightTitle)
    }
    
    private func setupLayout() {
        leftTitle.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        rightTitle.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-23)
            make.top.equalTo(self).offset(15)
        }
    }
    
    func configuration(headerLeftTitle: String, headerRightTitle: String?) {
        leftTitle.text = headerLeftTitle
        rightTitle.text = headerRightTitle
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leftTitle.text = nil
        rightTitle.text = nil
    }
    
    //MARK: Elements
    lazy var leftTitle: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Bold", size: 25)
        obj.textColor = .black
        return obj
    }()
    
    lazy var rightTitle: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Regular", size: 15)
        obj.textColor = Colors.orange
        return obj
    }()
}
