//
//  File.swift
//  Store
//
//  Created by Ян Нурков on 03.12.2022.

import Foundation
import UIKit
import SnapKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewController()
        self.delegate = self
        makeConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addRedDotAtTabBarItemIndex(index: 1)
        
    }
    
    func setupTabBarController() {
        tabBar.tintColor = .white
        tabBar.backgroundColor = Colors.blue
        tabBar.barTintColor = Colors.blue
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 30
        tabBar.unselectedItemTintColor = .white
    }
    
    
    func setupTabBarViewController() {
        let explorer = UINavigationController(rootViewController: ViewController())
        explorer.title = "                • Exploler"
        explorer.tabBarItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "MarkPro-Bold", size: 15)!], for: UIControl.State.normal)
       
        
        let basket = UINavigationController(rootViewController: CartViewController())
        let basketIcon = UITabBarItem(title: nil, image: UIImage(named: "bag"), selectedImage: UIImage(named: "bag"))
        basket.tabBarItem = basketIcon
        
        
        let favorits = UINavigationController(rootViewController: ViewController())
        let contactsIcon = UITabBarItem(title: nil, image: UIImage(named: "favorites"), selectedImage: UIImage(named: "favorites"))
        favorits.tabBarItem = contactsIcon
        
        let profile = ViewController()
        let profileIcon = UITabBarItem(title: nil, image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        profile.tabBarItem = profileIcon
        
        let controllers  = [explorer, basket, favorits, profile]
        self.setViewControllers(controllers, animated: true)
        
    }
    
  
    func makeConstraints() {
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 10, vertical: -6)
        tabBar.largeContentImage = UIImage(named: "user")
        tabBar.items![1].imageInsets = UIEdgeInsets(top: 15, left: 40, bottom: -15, right: -40)
        tabBar.items![2].imageInsets = UIEdgeInsets(top: 15, left: 20, bottom: -15, right: -20)
        tabBar.items![3].imageInsets = UIEdgeInsets(top: 16, left: -5, bottom: -15, right: 5)
        
    }
    
    func addRedDotAtTabBarItemIndex(index: Int) {
        for subview in tabBar.subviews {
            
                if subview.tag == 1234 {
                    subview.removeFromSuperview()
                    break
            }
        }

        let RedDotRadius: CGFloat = 6
        let RedDotDiameter = RedDotRadius * 2

        let TopMargin:CGFloat = 22

        let TabBarItemCount = CGFloat(tabBar.items!.count)

        let screenSize = UIScreen.main.bounds
        let HalfItemWidth = (screenSize.width) / (TabBarItemCount * 2)

        let  xOffset = HalfItemWidth * CGFloat(index * 2 + 1)

        let imageHalfWidth: CGFloat = (tabBar.items![index] ).selectedImage!.size.width / 2

        let redDot = UIView(frame: CGRect(x: xOffset + imageHalfWidth + 31, y: TopMargin, width: RedDotDiameter, height: RedDotDiameter))

        redDot.tag = 1234
        redDot.backgroundColor = UIColor.red
        redDot.layer.cornerRadius = RedDotRadius
        
        let label = UILabel(frame: CGRect(x: 3, y: 2, width: 10, height: 7))
        label.text = "2"
        label.textColor = .white
        label.font = .systemFont(ofSize: 9)
        
        tabBar.addSubview(redDot)
        redDot.addSubview(label)
    }
    
}
