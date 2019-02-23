//
//  PaymentViewController - Layout.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension PaymentViewController {
    func layoutUI() {
        self.layoutTitleContainer()
        self.layoutTitleLabel()
        self.layoutMerchantIcon()
        
        self.layoutInputLabel()
        self.layoutInputDesc()
        self.layoutAmountTextField()
        
        self.layoutNextButton()
    }
    
    //MARK: Top Title
    private func layoutTitleContainer() {
        [titleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         titleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        titleContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        titleContainer.heightAnchor.constraint(equalToConstant: 60)].forEach({$0.isActive = true})
    }
    
    private func layoutTitleLabel() {
        [titleLabel.centerXAnchor.constraint(equalTo: titleContainer.centerXAnchor),
         titleLabel.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor)].forEach({$0.isActive = true})
    }
    
    private func layoutMerchantIcon() {
        let size: CGFloat = 20
        [merchantIcon.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 20),
        merchantIcon.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
        merchantIcon.widthAnchor.constraint(equalToConstant: size),
        merchantIcon.heightAnchor.constraint(equalToConstant: size)].forEach({$0.isActive = true})
        
    }
    
    //MARK: Inputs
    private func layoutInputLabel() {
        [inputLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        inputLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        inputLabel.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 30)].forEach({$0.isActive = true})
    }
    
    private func layoutInputDesc() {
        [inputDesc.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor),
        inputDesc.trailingAnchor.constraint(equalTo: inputLabel.trailingAnchor),
        inputDesc.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 5)].forEach({$0.isActive = true})
    }
    
    private func layoutAmountTextField() {
        [amountTextField.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor),
        amountTextField.trailingAnchor.constraint(equalTo: inputLabel.trailingAnchor),
        amountTextField.topAnchor.constraint(equalTo: inputDesc.bottomAnchor, constant: 15),
        amountTextField.heightAnchor.constraint(equalToConstant: 25)].forEach({$0.isActive = true})
    }
    
    private func layoutNextButton() {
        [nextButton.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor),
        nextButton.trailingAnchor.constraint(equalTo: inputLabel.trailingAnchor),
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
        nextButton.heightAnchor.constraint(equalToConstant: 45)].forEach({$0.isActive = true})
    }
}
