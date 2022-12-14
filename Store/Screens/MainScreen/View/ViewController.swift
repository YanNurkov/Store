//
//  ViewController.swift
//  Store
//
//  Created by Ян Нурков on 03.12.2022.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
   
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        configView()
        makeConstraints()
        callToViewModelForUIUpdate()
        collectionView.allowsMultipleSelection = false
    }
    
    //MARK: Functions
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    func callToViewModelForUIUpdate() {
        self.viewModel = ViewModel()
        self.viewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource () {
        self.dataSourceHomeStore = CollectionViewDataSource(cellIdentifier1: HotSalesCollectionCell.identifier, cellIdentifier2: PhonesCollectionViewCell.identifier, items1: self.viewModel.empData.home_store, items2: self.viewModel.empData.best_seller, configureCell1: { cell, evm in
            cell.nameItem.text = evm.title
            cell.about.text = evm.subtitle
            cell.image.sd_setImage(with: URL(string: (evm.picture)), placeholderImage: UIImage(named: "pizza1"))
            if evm.is_new == true {
                cell.new.isHidden = false
            }
        }, configureCell2: { cell2, evm in
            let newPrice = "$" + String(evm.discount_price)
            let lastPrice = "$" + String(evm.price_without_discount)
            cell2.newPrice.text = newPrice
            cell2.lastPrice.text = lastPrice
            cell2.name.text = evm.title
            cell2.image.sd_setImage(with: URL(string: evm.picture), placeholderImage: UIImage(named: "pizza1"))
        })
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSourceHomeStore
            self.collectionView.reloadData()
        }
    }
    
    func configView() {
        setTitle("Zihuatanejo, Gro", andImage: UIImage(named: "location")!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "funnel"), style: .plain, target: self, action: #selector(openBottomSheet))
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        view.addSubview(collectionView)
    }
    
    func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
        
    }
    
    @objc func openBottomSheet() {
        let nav = BottomSheetViewController()
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(nav, animated: true, completion: nil)
    }
    
    
    //MARK: Elements
    private var viewModel: ViewModel!
    
    var lastSelectedIndexPath: IndexPath!
    
    private var dataSourceHomeStore : CollectionViewDataSource<HotSalesCollectionCell, PhonesCollectionViewCell, HomeStore, BestSeller>!
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        obj.register(HotSalesCollectionCell.self, forCellWithReuseIdentifier: HotSalesCollectionCell.identifier)
        obj.register(CollectionButtonViewCell.self, forCellWithReuseIdentifier: CollectionButtonViewCell.reduseID)
        obj.register(CollectionReusableView.self,
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                     withReuseIdentifier: CollectionReusableView.cellHeaderIdentifier)
        obj.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.cellSearchIdentifier)
        obj.register(PhonesCollectionViewCell.self, forCellWithReuseIdentifier: PhonesCollectionViewCell.identifier)
        obj.delegate = self
        return obj
    }()
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.8))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 15,
                                                                   bottom: 10,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(90),
                                                       heightDimension: .absolute(93))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 5,
                                                                      bottom: 0,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 1:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .absolute(40))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 0,
                                                                   bottom: 0,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                                                       heightDimension: .absolute(40))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitem: layoutItem,
                                                                     count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 0,
                                                                      trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(30))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
                
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .absolute(200))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 15,
                                                                   bottom: 10,
                                                                   trailing: 15)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                                                       heightDimension: .absolute(200))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitem: layoutItem,
                                                                     count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                      leading: 0,
                                                                      bottom: 0,
                                                                      trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 0)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 5,
                                                                   trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(237))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
                let spacing = CGFloat(10)
                group.interItemSpacing = .fixed(spacing)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                _ = UICollectionViewCompositionalLayout(section: section)
                
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 0)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                return section
                
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
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                
                
                let layout = UICollectionViewFlowLayout()
                _ = UICollectionView(frame: CGRect.zero,
                                     collectionViewLayout: layout)
                layout.scrollDirection = .vertical
                
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 0)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
    
    var previousSelected : IndexPath?
    var currentSelected : Int?
}

//MARK: Extension
extension UIViewController {
    func setTitle(_ title: String, andImage image: UIImage) {
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textColor = UIColor.black
        titleLbl.font = UIFont(name: "MarkPro-Medium", size: 15)
        let imageView = UIImageView(image: image)
        let titleView = UIStackView(arrangedSubviews: [imageView, titleLbl])
        titleView.axis = .horizontal
        titleView.spacing = 10.0
        navigationItem.titleView = titleView
    }
}

extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            guard lastSelectedIndexPath != indexPath else { return }
            if let index = lastSelectedIndexPath {
                let cell = collectionView.cellForItem(at: index) as! CollectionButtonViewCell
                cell.isSelected = false
            }
            let cell = collectionView.cellForItem(at: indexPath) as! CollectionButtonViewCell
            cell.isSelected = true
            lastSelectedIndexPath = indexPath
            
        case 3:
            let product = ProductViewController()
            self.navigationController?.pushViewController(product, animated: true)
        default:
            print("Error new screen")
        }
    }
    
    func update() {
        let cvb = CollectionButtonViewCell()
        cvb.buttonUpdate()
    }
}
