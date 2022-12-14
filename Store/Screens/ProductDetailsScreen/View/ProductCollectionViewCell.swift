//
//  ProductCollectionViewCell.swift
//  Store
//
//  Created by Ян Нурков on 12.12.2022.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Product"
    
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
    }
    
    func setupLayout() {
        image.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var employee : Product? {
        didSet {
            image.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "pizza1"))
        }
    }
    
    //MARK: Elements
    lazy var image: UIImageView = {
        let obj = UIImageView()
        obj.layer.cornerRadius = 20
        return obj
    }()
}
