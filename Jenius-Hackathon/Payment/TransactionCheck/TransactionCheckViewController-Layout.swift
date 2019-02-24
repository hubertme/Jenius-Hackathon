//
//  TransactionCheckViewController-Layout.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension TransactionCheckViewController {
    func layoutUI() {
        self.layoutTitleContainer()
        self.layoutTitleLabel()
        self.layoutMerchantIcon()
        
        self.layoutSuccessImage()
        self.layoutSuccessLabel()
        self.layoutDateLabel()
        
        self.layoutTransactionLabel()
        self.layoutRefLabel()
        self.layoutDoneButton()
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
    
    func layoutSuccessImage() {
        [successImageView.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 60),
        successImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        successImageView.widthAnchor.constraint(equalToConstant: 130),
        successImageView.heightAnchor.constraint(equalToConstant: 130)].forEach({$0.isActive = true})
    }
    
    func layoutSuccessLabel() {
        [successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         successLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 5)].forEach({$0.isActive = true})
    }
    
    func layoutDateLabel() {
        [dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         dateLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 5)].forEach({$0.isActive = true})
    }
    
    func layoutTransactionLabel() {
        [transactionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        transactionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 25)].forEach({$0.isActive
         = true})
    }
    
    func layoutRefLabel()  {
        [refLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         refLabel.topAnchor.constraint(equalTo: transactionLabel.bottomAnchor, constant: 5)].forEach({$0.isActive = true})
    }
    
    func layoutDoneButton() {
        [doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
         doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
         doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
         doneButton.heightAnchor.constraint(equalToConstant: 45)].forEach({$0.isActive = true})
    }
}
