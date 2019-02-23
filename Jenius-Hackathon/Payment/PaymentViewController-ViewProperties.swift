//
//  PaymentViewController - ViewProperties.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension PaymentViewController {
    func setupUI() {
        self.setupTitleContainer()
        self.setupTitleLabel()
        self.setupMerchantIcon()
        
        self.setupInputLabel()
        self.setupInputDesc()
        self.setupAmountTextField()
    }
    
    private func setupTitleContainer() {
        titleContainer = UIView()
        titleContainer.backgroundColor = .white
        titleContainer.translatesAutoresizingMaskIntoConstraints = false

        titleContainer.layer.shadowColor = UIColor.darkGray.cgColor
        titleContainer.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        titleContainer.layer.shadowRadius = 1
        titleContainer.layer.shadowOpacity = 0.5
        
        self.view.addSubview(titleContainer)
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "JENIUS Café"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = textGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleContainer.addSubview(titleLabel)
    }
    
    private func setupMerchantIcon()  {
        let iconImg = UIImage(named: "merchantIcon")
        merchantIcon = UIImageView(image: iconImg)
        merchantIcon.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleContainer.addSubview(merchantIcon)
    }
    
    private func setupInputLabel() {
        inputLabel = UILabel()
        inputLabel.text = "Input transaction amount"
        inputLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        inputLabel.textColor = mainColor
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(inputLabel)
    }
    
    private func setupInputDesc() {
        inputDesc = UILabel()
        inputDesc.text = "Enter total amount of transaction"
        inputDesc.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        inputDesc.textColor = textGray
        inputDesc.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(inputLabel)
    }
    
    private func setupAmountTextField() {
        amountTextField = UITextField()
        amountTextField.placeholder = "Amount"
        amountTextField.textAlignment = .left
        amountTextField.font = UIFont.systemFont(ofSize: 15)
        amountTextField.delegate = self
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(amountTextField)
    }
}

extension PaymentViewController: UITextFieldDelegate {
    
}
