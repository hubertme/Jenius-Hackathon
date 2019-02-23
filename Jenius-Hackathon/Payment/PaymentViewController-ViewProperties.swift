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
        
        self.setupNextButton()
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
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
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
    
    
    func setupInputLabel() {
        inputLabel = UILabel()
        inputLabel.text = "Input transaction amount"
        inputLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        inputLabel.textColor = mainColor
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.numberOfLines = 0
        inputLabel.lineBreakMode = .byWordWrapping
        
        self.view.addSubview(inputLabel)
    }
    
    func setupInputDesc() {
        inputDesc = UILabel()
        inputDesc.text = "Enter total amount of transaction"
        inputDesc.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        inputDesc.textColor = textGray
        inputDesc.translatesAutoresizingMaskIntoConstraints = false
        inputDesc.numberOfLines = 0
        inputDesc.lineBreakMode = .byWordWrapping
        
        self.view.addSubview(inputDesc)
    }
    
    func setupAmountTextField() {
        amountTextField = UITextField()
        amountTextField.placeholder = "Amount"
        amountTextField.textAlignment = .left
        amountTextField.font = UIFont.systemFont(ofSize: 14)
        amountTextField.textColor = .darkGray
        amountTextField.delegate = self
        amountTextField.addBottomBorder()
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(amountTextField)
    }
    
    func setupNextButton() {
        nextButton = UIButton()
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.tintColor = .white
        nextButton.backgroundColor = #colorLiteral(red: 0.7405559421, green: 0.8699820042, blue: 0.5067372322, alpha: 1)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(nextButton)
    }
}


