//
//  ConfirmationViewController-ViewProperties.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension ConfirmationViewController {
    func setupUI() {
        self.setupTitleContainer()
        self.setupTitleLabel()
        self.setupMerchantIcon()
        
        self.setupTransLabel()
        self.setupAmountLabel()
        
        self.setupInputLabel()
        self.setupInputDesc()
        self.setupAccountTextField()
        self.setupCheckButton()
        //Bottom desc thingy
        
        self.setupPayButton()
    }
    
    //MARK: Title
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
    
    //MARK: Transaction Label
    func setupTransLabel() {
        yourTransLabel = UILabel()
        yourTransLabel.text = "Your Transaction"
        yourTransLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        yourTransLabel.textColor = textGray
        yourTransLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(yourTransLabel)
    }
    
    func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.text = "Rp. 100.000"
        amountLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        amountLabel.textColor = textGray
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(amountLabel)
    }
    
    //MARK: Input
    func setupInputLabel() {
        inputLabel = UILabel()
        inputLabel.text = "Add account to proceed"
        inputLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        inputLabel.textColor = mainColor
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.numberOfLines = 0
        inputLabel.lineBreakMode = .byWordWrapping
        
        self.view.addSubview(inputLabel)
    }
    
    func setupInputDesc() {
        inputDesc = UILabel()
        inputDesc.text = "Enter your $cashtag, account number, or phone number"
        inputDesc.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        inputDesc.textColor = textGray
        inputDesc.translatesAutoresizingMaskIntoConstraints = false
        inputDesc.numberOfLines = 0
        inputDesc.lineBreakMode = .byWordWrapping
        
        self.view.addSubview(inputDesc)
    }
    
    func setupAccountTextField() {
        accountTextField = UITextField()
        accountTextField.placeholder = "Account"
        accountTextField.textAlignment = .left
        accountTextField.font = UIFont.systemFont(ofSize: 14)
        accountTextField.textColor = .darkGray
        accountTextField.delegate = self
        accountTextField.addBottomBorder()
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(accountTextField)
    }
    
    func setupCheckButton() {
        checkButton = UIButton()
        checkButton.setTitle("CHECK", for: .normal)
        checkButton.setTitleColor(#colorLiteral(red: 0.7405559421, green: 0.8699820042, blue: 0.5067372322, alpha: 1), for: .normal)
        checkButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        checkButton.backgroundColor = .white
        checkButton.layer.borderColor = #colorLiteral(red: 0.7405559421, green: 0.8699820042, blue: 0.5067372322, alpha: 1)
        checkButton.layer.borderWidth = 1.5
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(checkButton)
    }
    
    func setupPayButton() {
        payButton = UIButton()
        payButton.setTitle("PAY", for: .normal)
        payButton.tintColor = .white
        payButton.backgroundColor = #colorLiteral(red: 0.7405559421, green: 0.8699820042, blue: 0.5067372322, alpha: 1)
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(payButton)
    }

}

extension ConfirmationViewController: UITextFieldDelegate {
    
}
