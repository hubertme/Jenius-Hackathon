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
        let historyMenuIcon = UIImage(named: "menu_historyBlue")
        historyVC.title = "Transaction History"
        historyVC.tabBarItem = UITabBarItem(title: "Transaction History", image: historyMenuIcon, selectedImage: historyMenuIcon)

        let historyNavCon = UINavigationController(rootViewController: historyVC)
        
        let paymentVC = PaymentViewController()
        let paymentMenuIcon = UIImage(named: "menu_paymentBlue")
        paymentVC.title = "Payment"
        paymentVC.tabBarItem = UITabBarItem(title: "Payment", image: paymentMenuIcon, selectedImage: paymentMenuIcon)

        let paymentNavcon = UINavigationController(rootViewController: paymentVC)
        
        let merchantVC = UIViewController() //should be custom class
        let merchantMenuIcon = UIImage(named: "menu_merchantBlue")
        merchantVC.title = "My Merchant"
        merchantVC.tabBarItem = UITabBarItem(title: "My Merchant", image: merchantMenuIcon, selectedImage: merchantMenuIcon)
        
        let merchantNavCon = UINavigationController(rootViewController: merchantVC)

        let viewCons = [historyNavCon, paymentNavcon, merchantNavCon]
        
        self.tabBar.tintColor = mainColor
        self.viewControllers = viewCons
    }
}
