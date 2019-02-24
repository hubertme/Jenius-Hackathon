//
//  TransactionCheck.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class TransactionCheckViewController: UIViewController {
    var titleContainer: UIView!
    var titleLabel: UILabel!
    var merchantIcon: UIImageView!
    
    var successImageView: UIImageView!
    var successLabel: UILabel!
    var dateLabel: UILabel!
    
    var transactionLabel: UILabel!
    var refLabel: UILabel!
    var doneButton: UIButton!
    
    var enteredAmount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupUI()
        self.layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupLogoImage()
    }
}
