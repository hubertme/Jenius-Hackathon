//
//  PaymentViewController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    var titleContainer: UIView!
    var titleLabel: UILabel!
    var merchantIcon: UIImageView!
    
    var inputLabel: UILabel!
    var inputDesc: UILabel!
    var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.setupUI()
        self.layoutUI()
    }
}
