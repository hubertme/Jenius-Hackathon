//
//  ConfirmationViewController-Layout.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension ConfirmationViewController {
    func layoutUI() {
        self.layoutTitleContainer()
        self.layoutTitleLabel()
        self.layoutMerchantIcon()
        
        self.layoutTransLabel()
        self.layoutAmountLabel()
        
        self.layoutInputLabel()
        self.layoutInputDesc()
        self.layoutCheckButton()
        self.layoutAccountTextField()
        
        self.layoutPayButton()
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
    
    //MARK: Transaction amount
    private func layoutTransLabel() {
        [yourTransLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         yourTransLabel.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 20)].forEach({$0.isActive = true})
    }

    private func layoutAmountLabel() {
        [amountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         amountLabel.topAnchor.constraint(equalTo: yourTransLabel.bottomAnchor)].forEach({$0.isActive = true})
    }
    
    //MARK: Account Input
    private func layoutInputLabel() {
        [inputLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
         inputLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
         inputLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 30)].forEach({$0.isActive = true})
    }
    
    private func layoutInputDesc() {
        [inputDesc.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor),
         inputDesc.trailingAnchor.constraint(equalTo: inputLabel.trailingAnchor),
         inputDesc.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 5)].forEach({$0.isActive = true})
    }
    
    private func layoutCheckButton() {
        [checkButton.trailingAnchor.constraint(equalTo: inputDesc.trailingAnchor),
        checkButton.topAnchor.constraint(equalTo: inputDesc.bottomAnchor, constant: 15),
        checkButton.widthAnchor.constraint(equalToConstant: 60),
        checkButton.heightAnchor.constraint(equalToConstant: 30)].forEach({$0.isActive = true})
    }
    
    private func layoutAccountTextField() {
        [accountTextField.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor),
         accountTextField.trailingAnchor.constraint(equalTo: checkButton.leadingAnchor, constant: -10),
         accountTextField.bottomAnchor.constraint(equalTo: checkButton.bottomAnchor),
         accountTextField.heightAnchor.constraint(equalToConstant: 25)].forEach({$0.isActive = true})
    }
    
    private func layoutPayButton() {
        [payButton.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor),
         payButton.trailingAnchor.constraint(equalTo: inputLabel.trailingAnchor),
         payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
         payButton.heightAnchor.constraint(equalToConstant: 45)].forEach({$0.isActive = true})
    }
}
