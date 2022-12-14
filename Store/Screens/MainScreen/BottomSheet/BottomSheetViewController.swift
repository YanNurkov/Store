//
//  BottomSheetViewController.swift
//  Store
//
//  Created by Ян Нурков on 10.12.2022.
//

import UIKit
import SnapKit

class BottomSheetViewController: UIViewController {
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        makeConstraints()
    }
    
    //MARK: Functions
    func configView() {
        view.layer.cornerRadius = 25.0
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(label)
        view.addSubview(doneButton)
        view.addSubview(brandLabel)
        view.addSubview(brandWindow)
        brandWindow.addSubview(brandArrow)
        view.addSubview(priceLabel)
        view.addSubview(priceWindow)
        priceWindow.addSubview(priceArrow)
        view.addSubview(sizeLabel)
        view.addSubview(sizeWindow)
        sizeWindow.addSubview(sizeArrow)
        view.addSubview(brandMenu)
        brandMenu.addSubview(brandMenuSamsung)
        brandMenu.addSubview(brandMenuIphone)
        brandMenu.addSubview(brandMenuSony)
        view.addSubview(priceMenu)
        priceMenu.addSubview(priceMenu300500)
        priceMenu.addSubview(priceMenu5001000)
        view.addSubview(sizeMenu)
        sizeMenu.addSubview(sizeMenu4555)
        sizeMenu.addSubview(sizeMenu5570)
    }
    
    func makeConstraints() {
        closeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(44)
            make.top.equalToSuperview().offset(24)
            make.width.height.equalTo(37)
        }
        
        label.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.right).offset(10)
            make.top.equalToSuperview().offset(31)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(25)
        }
        
        doneButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(24)
            make.width.equalTo(86)
            make.height.equalTo(37)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.left)
            make.top.equalTo(closeButton.snp.bottom).offset(40)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        brandWindow.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.left)
            make.top.equalTo(brandLabel.snp.bottom).offset(10)
            make.height.equalTo(42)
            make.right.equalToSuperview().offset(-31)
        }
        
        brandArrow.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(25)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.left)
            make.top.equalTo(brandWindow.snp.bottom).offset(20)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
        priceWindow.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.left)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.height.equalTo(42)
            make.right.equalToSuperview().offset(-31)
        }
        
        priceArrow.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(25)
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.left)
            make.top.equalTo(priceWindow.snp.bottom).offset(20)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
        sizeWindow.snp.makeConstraints { make in
            make.left.equalTo(closeButton.snp.left)
            make.top.equalTo(sizeLabel.snp.bottom).offset(10)
            make.height.equalTo(42)
            make.right.equalToSuperview().offset(-31)
        }
        
        sizeArrow.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(25)
        }
        
        brandMenu.snp.makeConstraints { make in
            make.top.equalTo(brandWindow.snp.top)
            make.left.equalTo(brandWindow.snp.left)
            make.right.equalTo(brandWindow.snp.right)
            make.height.equalTo(130)
        }
        
        brandMenuSamsung.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        
        brandMenuIphone.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
            make.centerY.equalTo(brandMenu.snp.centerY)
        }
        
        brandMenuSony.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        priceMenu.snp.makeConstraints { make in
            make.top.equalTo(priceWindow.snp.top)
            make.left.equalTo(priceWindow.snp.left)
            make.right.equalTo(priceWindow.snp.right)
            make.height.equalTo(90)
        }
        
        priceMenu300500.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        
        priceMenu5001000.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        sizeMenu.snp.makeConstraints { make in
            make.top.equalTo(sizeWindow.snp.top)
            make.left.equalTo(sizeWindow.snp.left)
            make.right.equalTo(sizeWindow.snp.right)
            make.height.equalTo(90)
        }
        
        sizeMenu4555.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        
        sizeMenu5570.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    @objc func closeBottomMenu() {
        self.dismiss(animated: true)
    }
    
    @objc func brandPush() {
        self.brandMenu.isHidden = false
    }
    
    @objc func pushPrice() {
        self.priceMenu.isHidden = false
    }
    
    @objc func pushSize() {
        self.sizeMenu.isHidden = false
    }
    
    @objc func pushBrandName(sender: UIButton) {
        let text = sender.titleLabel?.text
        brandWindow.setTitle("   \(text!)", for: .normal)
        self.brandMenu.isHidden = true
    }
    
    @objc func pushPriceName(sender: UIButton) {
        let text = sender.titleLabel?.text
        priceWindow.setTitle("   \(text!)", for: .normal)
        self.priceMenu.isHidden = true
    }
    
    @objc func pushSizeName(sender: UIButton) {
        let text = sender.titleLabel?.text
        sizeWindow.setTitle("   \(text!)", for: .normal)
        self.sizeMenu.isHidden = true
    }
    
    //MARK: Elements
    lazy var closeButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.blue
        obj.setImage(UIImage(systemName: "xmark"), for: .normal)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        obj.addTarget(self, action: #selector(closeBottomMenu), for: .touchDown)
        return obj
    }()
    
    lazy var label: UILabel = {
        let obj = UILabel()
        obj.text = "Filter options"
        obj.font = UIFont(name: "MarkPro-Medium", size: 18)
        obj.textColor = Colors.blue
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var doneButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.orange
        obj.setTitle("Done", for: .normal)
        obj.titleLabel?.font =  UIFont(name: "MarkPro-Medium", size: 18)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        obj.addTarget(self, action: #selector(closeBottomMenu), for: .touchDown)
        return obj
    }()
    
    lazy var brandLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Brand"
        obj.font = UIFont(name: "MarkPro-Medium", size: 18)
        obj.textColor = Colors.blue
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var brandWindow: UIButton = {
        let obj = UIButton()
        obj.setTitle("   Samsung", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.layer.borderWidth = 1
        obj.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        obj.layer.cornerRadius = 5
        obj.addTarget(self, action: #selector(brandPush), for: .touchDown)
        return obj
    }()
    
    lazy var brandArrow: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "chevron")
        return obj
    }()
    
    lazy var priceLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Price"
        obj.font = UIFont(name: "MarkPro-Medium", size: 18)
        obj.textColor = Colors.blue
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var priceWindow: UIButton = {
        let obj = UIButton()
        obj.setTitle("   $300 - $500", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.layer.borderWidth = 1
        obj.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        obj.layer.cornerRadius = 5
        obj.addTarget(self, action: #selector(pushPrice), for: .touchDown)
        return obj
    }()
    
    lazy var priceArrow: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "chevron")
        return obj
    }()
    
    lazy var sizeLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Size"
        obj.font = UIFont(name: "MarkPro-Medium", size: 18)
        obj.textColor = Colors.blue
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var sizeWindow: UIButton = {
        let obj = UIButton()
        obj.setTitle("   4.5 to 5.5 inches", for: .normal)
        
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.layer.borderWidth = 1
        obj.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        obj.layer.cornerRadius = 5
        obj.addTarget(self, action: #selector(pushSize), for: .touchDown)
        return obj
    }()
    
    lazy var sizeArrow: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "chevron")
        return obj
    }()
    
    
    lazy var brandMenu: UIView = {
        let obj = UIView()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 5
        obj.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        obj.layer.shadowOpacity = 4
        obj.layer.shadowRadius = 20
        obj.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        obj.isHidden = true
        return obj
    }()
    
    lazy var brandMenuSamsung : UIButton = {
        let obj = UIButton()
        obj.setTitle("Samsung", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.addTarget(self, action: #selector(pushBrandName), for: .touchDown)
        return obj
    }()
    
    lazy var brandMenuIphone : UIButton = {
        let obj = UIButton()
        obj.setTitle("IPhone", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.addTarget(self, action: #selector(pushBrandName), for: .touchDown)
        return obj
    }()
    
    lazy var brandMenuSony : UIButton = {
        let obj = UIButton()
        obj.setTitle("Sony", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.addTarget(self, action: #selector(pushBrandName), for: .touchDown)
        return obj
    }()
    
    lazy var priceMenu: UIView = {
        let obj = UIView()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 5
        obj.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        obj.layer.shadowOpacity = 4
        obj.layer.shadowRadius = 20
        obj.layer.shadowOffset = CGSize(width: 0, height: 0)
        obj.isHidden = true
        return obj
    }()
    
    lazy var priceMenu300500 : UIButton = {
        let obj = UIButton()
        obj.setTitle("$300 - $500", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.addTarget(self, action: #selector(pushPriceName), for: .touchDown)
        return obj
    }()
    
    lazy var priceMenu5001000 : UIButton = {
        let obj = UIButton()
        obj.setTitle("$500 - $1000", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.addTarget(self, action: #selector(pushPriceName), for: .touchDown)
        return obj
    }()
    
    lazy var sizeMenu: UIView = {
        let obj = UIView()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 5
        obj.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        obj.layer.shadowOpacity = 4
        obj.layer.shadowRadius = 20
        obj.layer.shadowOffset = CGSize(width: 0, height: 0)
        obj.isHidden = true
        return obj
    }()
    
    lazy var sizeMenu4555 : UIButton = {
        let obj = UIButton()
        obj.setTitle("4.5 to 5.5 inches", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.addTarget(self, action: #selector(pushSizeName), for: .touchDown)
        obj.backgroundColor = .white
        return obj
    }()
    
    lazy var sizeMenu5570 : UIButton = {
        let obj = UIButton()
        obj.setTitle("5.5 to 7.0 inches", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.backgroundColor = .white
        obj.addTarget(self, action: #selector(pushSizeName), for: .touchDown)
        return obj
    }()
    
}


