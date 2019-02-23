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
        titleLabel.textColor = #colorLiteral(red: 0.5293635726, green: 0.5294427276, blue: 0.529346168, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleContainer.addSubview(titleLabel)
    }
    
    private func setupMerchantIcon()  {
        let iconImg = UIImage(named: "merchantIcon")
        merchantIcon = UIImageView(image: iconImg)
        merchantIcon.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleContainer.addSubview(merchantIcon)
    }
}
