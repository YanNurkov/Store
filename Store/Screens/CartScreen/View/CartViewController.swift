//
//  CartViewController.swift
//  Store
//
//  Created by Ян Нурков on 13.12.2022.
//

import UIKit
import SnapKit
import Combine

class CartViewController: UIViewController {
    
    private var cartViewModel: CartViewModel!
    
    private var dataSourceCart : CartTableViewDataSource<CartTableViewCell, Basket>!
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        makeConstraint()
        callToViewModelForUIUpdate()
        linkPublishers()
        configNavigation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: Functions
    
    func configView() {
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(buttonBack)
        view.addSubview(labelAddress)
        view.addSubview(buttonBasket)
        view.addSubview(labelCart)
        view.addSubview(viewBack)
        viewBack.addSubview(tableView)
        viewBack.addSubview(lineTop)
        viewBack.addSubview(labelTotal)
        viewBack.addSubview(labelDelivery)
        viewBack.addSubview(labelPrice)
        viewBack.addSubview(labelPriceDelivery)
        viewBack.addSubview(lineBottom)
        viewBack.addSubview(buttonAddCart)
    }
    
    func makeConstraint() {
        buttonBack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(42)
            make.top.equalToSuperview().offset(79)
            make.width.height.equalTo(37)
        }
        
        labelAddress.snp.makeConstraints { make in
            make.width.equalTo(95)
            make.height.equalTo(19)
            make.centerY.equalTo(buttonBack.snp.centerY)
            make.right.equalTo(buttonBasket.snp.left).offset(-9)
        }
        
        buttonBasket.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-42)
            make.top.equalToSuperview().offset(79)
            make.width.height.equalTo(37)
        }
        
        labelCart.snp.makeConstraints { make in
            make.width.equalTo(145)
            make.height.equalTo(45)
            make.left.equalToSuperview().offset(42)
            make.top.equalToSuperview().offset(166)
        }
        
        viewBack.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(labelCart.snp.bottom).offset(49)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(80)
            make.bottom.equalToSuperview().offset(-217)
        }
        
        lineTop.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(2)
            make.top.equalTo(tableView.snp.bottom)
        }
        
        labelTotal.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(55)
            make.top.equalTo(lineTop.snp.bottom).offset(15)
            make.width.equalTo(40)
            make.height.equalTo(19)
        }
        
        labelDelivery.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(55)
            make.top.equalTo(labelTotal.snp.bottom).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(19)
        }
        
        labelPrice.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-35)
            make.centerY.equalTo(labelTotal.snp.centerY)
            make.width.equalTo(78)
            make.height.equalTo(19)
        }
        
        labelPriceDelivery.snp.makeConstraints { make in
            make.left.equalTo(labelPrice.snp.left)
            make.right.equalTo(labelPrice.snp.right)
            make.centerY.equalTo(labelDelivery.snp.centerY)
            make.height.equalTo(19)
        }
        
        lineBottom.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(1)
            make.top.equalTo(lineTop.snp.bottom).offset(95)
        }
        
        buttonAddCart.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    
    func configNavigation () {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func linkPublishers() {
        cartViewModel.objectWillChange.sink { (_) in
            DispatchQueue.main.async {
                self.labelPriceDelivery.text = self.cartViewModel.delivery
                self.labelPrice.text = self.cartViewModel.total
            }
        }
        .store(in: &cancellables)
    }
    
    func callToViewModelForUIUpdate() {
        self.cartViewModel = CartViewModel()
        self.cartViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource () {
        self.dataSourceCart = CartTableViewDataSource(cellIdentifier: CartTableViewCell.reduseID, items: self.cartViewModel.empData, configureCell: { cell, evm in
            cell.nameLabel.text = evm.title
            cell.image.sd_setImage(with: URL(string: (evm.images)), placeholderImage: UIImage(named: "pizza1"))
            cell.pricePhoneLabel.text = String("$ \(evm.price)")
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSourceCart
            self.tableView.reloadData()
        }
    }
    
    @objc func back () {
        let main = ViewController()
        self.navigationController?.pushViewController(main, animated: false)
    }
    
    
    lazy var buttonBack: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.blue
        obj.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        obj.addTarget(self, action: #selector(back), for: .touchDown)
        return obj
    }()
    
    lazy var labelAddress: UILabel = {
        let obj = UILabel()
        obj.text = "Add address"
        obj.font = UIFont(name: "MarkPro-Medium", size: 15)
        obj.textColor = Colors.blue
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var buttonBasket: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.orange
        obj.setImage(UIImage(named: "locationWhite"), for: .normal)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        return obj
    }()
    
    lazy var labelCart: UILabel = {
        let obj = UILabel()
        obj.text = "My Cart"
        obj.font = UIFont(name: "MarkPro-Bold", size: 35)
        obj.textColor = Colors.blue
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var viewBack: UIView = {
        let obj = UIView()
        obj.backgroundColor = Colors.blue
        obj.layer.cornerRadius = 30
        obj.layer.shadowColor = UIColor(red: 0.298, green: 0.372, blue: 0.562, alpha: 0.2).cgColor
        obj.layer.shadowOpacity = 1
        obj.layer.shadowRadius = 20
        obj.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        return obj
    }()
    
    lazy var tableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .plain)
        obj.rowHeight = 150
        obj.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reduseID)
        obj.backgroundColor = .clear
        obj.separatorInset = UIEdgeInsets.zero
        obj.separatorStyle = .none
        obj.sectionHeaderTopPadding = 0.0
        return obj
    }()
    
    
    lazy var lineTop: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.29, alpha: 1.00)
        return obj
    }()
    
    lazy var labelTotal: UILabel = {
        let obj = UILabel()
        obj.text = "Total"
        obj.font = UIFont(name: "MarkPro-Regular", size: 15)
        obj.textColor = .white
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var labelDelivery: UILabel = {
        let obj = UILabel()
        obj.text = "Dilivery"
        obj.font = UIFont(name: "MarkPro-Regular", size: 15)
        obj.textColor = .white
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var labelPrice: UILabel = {
        let obj = UILabel()
        obj.text = "999999"
        obj.font = UIFont(name: "MarkPro-Bold", size: 15)
        obj.textColor = .white
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var labelPriceDelivery: UILabel = {
        let obj = UILabel()
        obj.text = "free"
        obj.font = UIFont(name: "MarkPro-Bold", size: 15)
        obj.textColor = .white
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var lineBottom: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.29, alpha: 1.00)
        return obj
    }()
    
    lazy var buttonAddCart: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.orange
        obj.setTitle("Checkout", for: .normal)
        obj.contentHorizontalAlignment = .center
        obj.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        obj.setTitleColor(.white, for: .normal)
        obj.layer.cornerRadius = 10
        return obj
    }()
}
