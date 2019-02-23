//
//  MainTabBarController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let historyVC = UIViewController() //should be custom class
        let historyMenuIcon = UIImage(named: "historyIcon")
        historyVC.title = "Transaction History"
        historyVC.tabBarItem = UITabBarItem(title: "TransactionHistory", image: historyMenuIcon, selectedImage: historyMenuIcon)
        let historyNavCon = UINavigationController(rootViewController: historyVC)
        
        let paymentVC = UIViewController() //should be custom class
        let paymentMenuIcon = UIImage(named: "paymentIcon")
        paymentVC.title = "Payment"
        paymentVC.tabBarItem = UITabBarItem(title: "Payment", image: paymentMenuIcon, selectedImage: paymentMenuIcon)
        let paymentNavcon = UINavigationController(rootViewController: paymentVC)
        
        let merchantVC = UIViewController() //should be custom class
        let merchantMenuIcon = UIImage(named: "merchantIcon")
        merchantVC.title = "My Merchant"
        merchantVC.tabBarItem = UITabBarItem(title: "My Merchant", image: merchantMenuIcon, selectedImage: merchantMenuIcon)
        let merchantNavCon = UINavigationController(rootViewController: merchantVC)

        let viewCons = [historyNavCon, paymentNavcon, merchantNavCon]
        self.tabBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) //Change accordingly
        self.tabBar.selectedItem = tabBar.items![1]
        self.viewControllers = viewCons
    }
}
