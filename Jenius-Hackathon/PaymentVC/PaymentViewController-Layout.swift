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
    }
    
    private func layoutTitleContainer() {
        [titleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         titleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        titleContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        titleContainer.heightAnchor.constraint(equalToConstant: 40)].forEach({$0.isActive = true})
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
}
