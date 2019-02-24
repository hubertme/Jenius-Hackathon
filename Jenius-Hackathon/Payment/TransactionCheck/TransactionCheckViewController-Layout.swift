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
        [successImageView.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 50),
        successImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        successImageView.widthAnchor.constraint(equalToConstant: 100),
        successImageView.heightAnchor.constraint(equalToConstant: 100)].forEach({$0.isActive = true})
    }
    
    func layoutSuccessLabel() {
        [successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         successLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 10)].forEach({$0.isActive = true})
    }
    
    func layoutDateLabel() {
        [dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         dateLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 10)].forEach({$0.isActive = true})
    }
}
