//
//  ProductViewController.swift
//  Store
//
//  Created by Ян Нурков on 12.12.2022.
//

import UIKit
import SDWebImage
import SnapKit

class ProductViewController: UIViewController {
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        makeConstraints()
        callToViewModelForUIUpdate()
        tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: Functions
    func callToViewModelForUIUpdate() {
        self.productViewModel = ProductViewModel()
        self.productViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource () {
        self.dataSourceProduct = ProductCollectionViewDataSource(cellIdentifier: ProductCollectionViewCell.identifier, items: self.productViewModel.empData, configureCell: { cell, evm in
            cell.image.sd_setImage(with: URL(string: (evm.images[0])), placeholderImage: UIImage(named: "pizza1"))
            cell.layer.shadowColor = UIColor(red: 0.298, green: 0.372, blue: 0.562, alpha: 0.2).cgColor
            cell.layer.shadowOpacity = 1
            cell.layer.shadowRadius = 5
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.labelName.text = evm.title
            self.cpuName.text = evm.CPU
            self.photoName.text = evm.camera
            self.ramName.text = evm.ssd
            self.memoryName.text = evm.sd
            self.color1.backgroundColor = hexStringToUIColor(hex: evm.color[0])
            self.color2.backgroundColor = hexStringToUIColor(hex: evm.color[1])
            self.memory1.setTitle("\(evm.capacity[0]) GB", for: .normal)
            self.memory2.setTitle("\(evm.capacity[1]) GB", for: .normal)
            self.buttonAddCart.setTitle(String("Add to Cart              $ \(evm.price)"), for: .normal)
        })
        
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSourceProduct
            self.collectionView.reloadData()
        }
    }
    
    func configView() {
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(buttonBack)
        view.addSubview(label)
        view.addSubview(buttonBasket)
        view.addSubview(collectionView)
        view.addSubview(viewBack)
        viewBack.addSubview(labelName)
        viewBack.addSubview(buttonLike)
        viewBack.addSubview(star1)
        viewBack.addSubview(star2)
        viewBack.addSubview(star3)
        viewBack.addSubview(star4)
        viewBack.addSubview(star5)
        viewBack.addSubview(buttonShop)
        viewBack.addSubview(buttonDetails)
        viewBack.addSubview(buttonFeatures)
        viewBack.addSubview(line)
        viewBack.addSubview(line2)
        viewBack.addSubview(line3)
        viewBack.addSubview(cpu)
        viewBack.addSubview(cpuName)
        viewBack.addSubview(photo)
        viewBack.addSubview(photoName)
        viewBack.addSubview(ram)
        viewBack.addSubview(ramName)
        viewBack.addSubview(memory)
        viewBack.addSubview(memoryName)
        viewBack.addSubview(labelSelectColor)
        viewBack.addSubview(color1)
        viewBack.addSubview(color2)
        viewBack.addSubview(memory1)
        viewBack.addSubview(memory2)
        viewBack.addSubview(buttonAddCart)
    }
    
    @objc func cart () {
        let main = CartViewController()
        self.navigationController?.pushViewController(main, animated: false)
    }
    
    @objc func back () {
        let main = ViewController()
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    func makeConstraints() {
        buttonBack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(42)
            make.top.equalToSuperview().offset(79)
            make.width.height.equalTo(37)
        }
        
        label.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(25)
            make.centerY.equalTo(buttonBack.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        buttonBasket.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-42)
            make.top.equalToSuperview().offset(79)
            make.width.height.equalTo(37)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(320)
        }
        
        viewBack.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(7)
        }
        
        labelName.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(38)
            make.top.equalToSuperview().offset(28)
            make.height.equalTo(30)
            make.width.equalTo(250)
        }
        
        buttonLike.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-37)
            make.centerY.equalTo(labelName.snp.centerY)
            make.width.height.equalTo(37)
        }
        
        star1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(38)
            make.top.equalToSuperview().offset(65)
            make.width.height.equalTo(18)
        }
        
        star2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(65)
            make.top.equalToSuperview().offset(65)
            make.width.height.equalTo(18)
        }
        
        star3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(92)
            make.top.equalToSuperview().offset(65)
            make.width.height.equalTo(18)
        }
        
        star4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(119)
            make.top.equalToSuperview().offset(65)
            make.width.height.equalTo(18)
        }
        
        star5.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(146)
            make.top.equalToSuperview().offset(65)
            make.width.height.equalTo(18)
        }
        
        buttonShop.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(45)
            make.top.equalTo(star1.snp.bottom).offset(32)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
        buttonDetails.snp.makeConstraints { make in
            make.top.equalTo(star1.snp.bottom).offset(32)
            make.width.equalTo(70)
            make.height.equalTo(25)
            make.centerX.equalTo(viewBack.snp.centerX)
        }
        
        buttonFeatures.snp.makeConstraints { make in
            make.top.equalTo(star1.snp.bottom).offset(32)
            make.width.equalTo(88)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-40)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(buttonShop.snp.bottom).offset(8)
            make.width.equalTo(90)
            make.height.equalTo(2)
            make.centerX.equalTo(buttonShop.snp.centerX)
        }
        
        line2.snp.makeConstraints { make in
            make.top.equalTo(buttonDetails.snp.bottom).offset(8)
            make.width.equalTo(90)
            make.height.equalTo(2)
            make.centerX.equalTo(buttonDetails.snp.centerX)
        }
        
        line3.snp.makeConstraints { make in
            make.top.equalTo(buttonFeatures.snp.bottom).offset(8)
            make.width.equalTo(90)
            make.height.equalTo(2)
            make.centerX.equalTo(buttonFeatures.snp.centerX)
        }
        
        cpu.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(45)
            make.top.equalTo(line.snp.bottom).offset(25)
            make.width.height.equalTo(28)
        }
        
        cpuName.snp.makeConstraints { make in
            make.width.equalTo(69)
            make.height.equalTo(14)
            make.top.equalTo(cpu.snp.bottom).offset(5)
            make.centerX.equalTo(cpu.snp.centerX)
        }
        
        photo.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(25)
            make.width.height.equalTo(28)
            // make.left.equalToSuperview().offset(152)
            make.right.equalTo(viewBack.snp.centerX).offset(-33)
        }
        
        photoName.snp.makeConstraints { make in
            make.width.equalTo(69)
            make.height.equalTo(14)
            make.top.equalTo(photo.snp.bottom).offset(5)
            make.centerX.equalTo(photo.snp.centerX)
        }
        
        ram.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(25)
            make.width.height.equalTo(28)
            make.left.equalTo(viewBack.snp.centerX).offset(33)
        }
        
        ramName.snp.makeConstraints { make in
            make.width.equalTo(69)
            make.height.equalTo(14)
            make.top.equalTo(ram.snp.bottom).offset(5)
            make.centerX.equalTo(ram.snp.centerX)
        }
        
        memory.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(25)
            make.width.height.equalTo(28)
            make.right.equalToSuperview().offset(-45)
        }
        
        memoryName.snp.makeConstraints { make in
            make.width.equalTo(69)
            make.height.equalTo(14)
            make.top.equalTo(memory.snp.bottom).offset(5)
            make.centerX.equalTo(memory.snp.centerX)
        }
        
        labelSelectColor.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(230)
            make.height.equalTo(21)
            make.width.equalTo(200)
        }
        
        color1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(34)
            make.width.height.equalTo(40)
            make.top.equalTo(labelSelectColor.snp.bottom).offset(14)
        }
        
        color2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(93)
            make.width.height.equalTo(40)
            make.top.equalTo(labelSelectColor.snp.bottom).offset(14)
        }
        
        memory1.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-140)
            make.width.equalTo(78)
            make.height.equalTo(35)
            make.top.equalTo(labelSelectColor.snp.bottom).offset(17)
        }
        
        memory2.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(78)
            make.height.equalTo(35)
            make.top.equalTo(labelSelectColor.snp.bottom).offset(17)
        }
        
        buttonAddCart.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-25)
        }
    }
    
    //MARK: Elements
    private var productViewModel: ProductViewModel!
    
    private var dataSourceProduct : ProductCollectionViewDataSource<ProductCollectionViewCell, Product>!
    
    var tab: Bool = false
    
    lazy var buttonBack: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.blue
        obj.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        obj.addTarget(self, action: #selector(back), for: .touchDown)
        return obj
    }()
    
    lazy var label: UILabel = {
        let obj = UILabel()
        obj.text = "Product Details"
        obj.font = UIFont(name: "MarkPro-Medium", size: 18)
        obj.textColor = Colors.blue
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var buttonBasket: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.orange
        obj.setImage(UIImage(named: "bag"), for: .normal)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        obj.addTarget(self, action: #selector(cart), for: .touchDown)
        return obj
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        obj.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        return obj
    }()
    
    lazy var viewBack: UIView = {
        let obj = UIView()
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 30
        obj.layer.shadowColor = UIColor(red: 0.298, green: 0.372, blue: 0.562, alpha: 0.2).cgColor
        obj.layer.shadowOpacity = 1
        obj.layer.shadowRadius = 20
        obj.layer.shadowOffset = CGSize(width: 0, height: 0)
        return obj
    }()
    
    
    lazy var labelName: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Medium", size: 24)
        obj.textColor = Colors.blue
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var buttonLike: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.blue
        obj.setImage(UIImage(named:"favorites"), for: .normal)
        obj.tintColor = .white
        obj.layer.cornerRadius = 10
        obj.addTarget(self, action: #selector(touch), for: .touchDown)
        return obj
    }()
    
    lazy var star1: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(systemName: "star.fill")
        obj.tintColor = .systemYellow
        return obj
    }()
    
    lazy var star2: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(systemName: "star.fill")
        obj.tintColor = .systemYellow
        return obj
    }()
    
    lazy var star3: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(systemName: "star.fill")
        obj.tintColor = .systemYellow
        return obj
    }()
    
    lazy var star4: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(systemName: "star.fill")
        obj.tintColor = .systemYellow
        return obj
    }()
    
    lazy var star5: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(systemName: "star.fill")
        obj.tintColor = .systemYellow
        return obj
    }()
    
    lazy var buttonShop: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .white
        obj.setTitle("Shop", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        obj.setTitleColor(Colors.blue, for: .normal)
        obj.addTarget(self, action: #selector(buttonMenuAction), for: .touchDown)
        return obj
    }()
    
    lazy var buttonDetails: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .white
        obj.setTitle("Details", for: .normal)
        obj.contentHorizontalAlignment = .center
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
        obj.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
        obj.addTarget(self, action: #selector(buttonMenuAction), for: .touchDown)
        return obj
    }()
    
    lazy var buttonFeatures: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .white
        obj.setTitle("Features", for: .normal)
        obj.contentHorizontalAlignment = .left
        obj.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
        obj.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
        obj.addTarget(self, action: #selector(buttonMenuAction), for: .touchDown)
        return obj
    }()
    
    lazy var line : UIView = {
        let obj = UIView()
        obj.backgroundColor = Colors.orange
        obj.isHidden = false
        obj.layer.cornerRadius = 2
        return obj
    }()
    
    lazy var line2 : UIView = {
        let obj = UIView()
        obj.backgroundColor = Colors.orange
        obj.isHidden = true
        obj.layer.cornerRadius = 2
        return obj
    }()
    
    lazy var line3 : UIView = {
        let obj = UIView()
        obj.backgroundColor = Colors.orange
        obj.isHidden = true
        obj.layer.cornerRadius = 2
        return obj
    }()
    
    lazy var cpu : UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "exinos")
        return obj
    }()
    
    lazy var cpuName: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Regular", size: 11)
        obj.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        obj.textAlignment = .center
        return obj
    }()
    
    
    lazy var photo : UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "photo")
        return obj
    }()
    
    lazy var photoName: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Regular", size: 11)
        obj.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var ram : UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "RAM")
        return obj
    }()
    
    lazy var ramName: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Regular", size: 11)
        obj.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var memory : UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "memory")
        return obj
    }()
    
    lazy var memoryName: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "MarkPro-Regular", size: 11)
        obj.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var labelSelectColor: UILabel = {
        let obj = UILabel()
        obj.text = "Select color and capacity"
        obj.font = UIFont(name: "MarkPro-Medium", size: 16)
        obj.textColor = Colors.blue
        obj.textAlignment = .left
        return obj
    }()
    
    lazy var color1: UIButton = {
        let obj = UIButton()
        obj.layer.cornerRadius = 20
        obj.backgroundColor = .brown
        obj.setImage(UIImage(named: "done"), for: .normal)
        obj.addTarget(self, action: #selector(buttonColorAction), for: .touchDown)
        return obj
    }()
    
    lazy var color2: UIButton = {
        let obj = UIButton()
        obj.layer.cornerRadius = 20
        obj.backgroundColor = .blue
        obj.addTarget(self, action: #selector(buttonColorAction), for: .touchDown)
        return obj
    }()
    
    lazy var memory1: UIButton = {
        let obj = UIButton()
        obj.layer.cornerRadius = 10
        obj.backgroundColor = Colors.orange
        obj.tintColor = .white
        obj.contentHorizontalAlignment = .center
        obj.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        obj.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        return obj
    }()
    
    lazy var memory2: UIButton = {
        let obj = UIButton()
        obj.layer.cornerRadius = 10
        obj.backgroundColor = .white
        obj.setTitleColor(UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1), for: .normal)
        obj.contentHorizontalAlignment = .center
        obj.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        obj.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        return obj
    }()
    
    lazy var buttonAddCart: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = Colors.orange
        obj.setTitle("Add to Cart", for: .normal)
        obj.contentHorizontalAlignment = .center
        obj.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        obj.setTitleColor(.white, for: .normal)
        obj.layer.cornerRadius = 10
        return obj
    }()
    
    @objc func touch() {
        if tab == false {
            tab = true
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            tab = false
            buttonLike.setImage(UIImage(named: "favorites"), for: .normal)
        }
    }
    
    @objc func buttonColorAction(sender:UIButton) {
        if sender == color1 {
            color1.setImage(UIImage(named: "done"), for: .normal)
            color2.setImage(UIImage(named: ""), for: .normal)
        } else if sender == color2 {
            color2.setImage(UIImage(named: "done"), for: .normal)
            color1.setImage(UIImage(named: ""), for: .normal)
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        if sender == memory1 {
            
            memory1.backgroundColor = Colors.orange
            memory1.setTitleColor(.white, for: .normal)
            
            memory2.backgroundColor = .white
            memory2.setTitleColor(UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1), for: .normal)
        } else if sender == memory2{
            memory2.backgroundColor = Colors.orange
            memory2.setTitleColor(.white, for: .normal)
            
            memory1.backgroundColor = .white
            memory1.setTitleColor(UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1), for: .normal)
        }
    }
    
    //MARK: Functions
    @objc func buttonMenuAction(sender: UIButton) {
        if sender == buttonShop {
            buttonShop.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
            buttonShop.setTitleColor(Colors.blue, for: .normal)
            line.isHidden = false
            
            buttonDetails.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
            buttonDetails.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            line2.isHidden = true
            
            buttonFeatures.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
            buttonFeatures.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            line3.isHidden = true
        } else if sender == buttonDetails {
            buttonShop.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
            buttonShop.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            line.isHidden = true
            
            buttonDetails.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
            buttonDetails.setTitleColor(Colors.blue, for: .normal)
            line2.isHidden = false
            
            buttonFeatures.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
            buttonFeatures.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            line3.isHidden = true
            
        } else if sender == buttonFeatures {
            buttonShop.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
            buttonShop.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            line.isHidden = true
            
            buttonDetails.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
            buttonDetails.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            line2.isHidden = true
            
            buttonFeatures.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
            buttonFeatures.setTitleColor(Colors.blue, for: .normal)
            line3.isHidden = false
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .absolute(320))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 55,
                                                                   bottom: 10,
                                                                   trailing: 55)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                                                       heightDimension: .absolute(318))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitem: layoutItem,
                                                                     count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                      leading: 0,
                                                                      bottom: 0,
                                                                      trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                
                return layoutSection
                
                
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 0,
                                                                   trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.1),
                    heightDimension: .estimated(500)
                )
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 0,
                                                                      trailing: 0)
                
                
                let layout = UICollectionViewFlowLayout()
                _ = UICollectionView(frame: CGRect.zero,
                                     collectionViewLayout: layout)
                layout.scrollDirection = .horizontal
                
                return layoutSection
            }
        }
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


