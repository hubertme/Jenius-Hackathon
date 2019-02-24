//
//  ConfirmatioViewController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var titleContainer: UIView!
    var titleLabel: UILabel!
    var merchantIcon: UIImageView!
    
    var yourTransLabel: UILabel!
    var amountLabel: UILabel!
    
    var inputLabel: UILabel!
    var inputDesc: UILabel!
    var accountTextField: UITextField!
    var checkButton: UIButton!
    
    var payButton: UIButton!
    
    var enteredAmount: Int? {
        didSet {
            print(self.amountLabel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupUI()
        self.layoutUI()
        
        payButton.addTarget(self, action: #selector(handlePayButton), for: .touchUpInside)
        checkButton.addTarget(self, action: #selector(handleCheckButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addJeniusCoCreateLogo(self)
    }
    
    @objc func handlePayButton() {
        let pinVC = PinEnterViewController()
        pinVC.enteredAmount = self.amountLabel.text
        self.navigationController?.pushViewController(pinVC, animated: true)
    }
    
    @objc func handleCheckButton() {
        
    }
}
