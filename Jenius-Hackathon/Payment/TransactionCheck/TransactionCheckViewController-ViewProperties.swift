//
//  TransactionCheckViewController-ViewProperties.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension TransactionCheckViewController {
    func setupUI() {
        self.setupTitleContainer()
        self.setupTitleLabel()
        self.setupMerchantIcon()
        
        self.setupSuccessImage()
        self.setupSuccessLabel()
        self.setupDateLabel()
        
        self.setupTransactionLabel()
        self.setupRefLabel()
        
        self.setupDoneButton()
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
    
    func setupSuccessImage() {
        let successImg = UIImage(named: "icon_success")
        successImageView = UIImageView(image: successImg)
        successImageView.contentMode = .scaleAspectFit
        successImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(successImageView)
    }
    
    func setupSuccessLabel() {
        successLabel = UILabel()
        successLabel.text = "Transaksi Berhasil!"
        successLabel.textColor = #colorLiteral(red: 0.7405376434, green: 0.870012939, blue: 0.5019586086, alpha: 1)
        successLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(successLabel)
    }
    
    func setupDateLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy - hh.mm a"
        dateLabel = UILabel()
        dateLabel.text = dateFormatter.string(from: Date())
        dateLabel.textColor = textGray
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(dateLabel)
    }
    
    func setupTransactionLabel() {
        transactionLabel = UILabel()
        transactionLabel.textColor = textGray
        transactionLabel.text = "\(self.enteredAmount ?? "Rp. 100000") ke JENIUS Café"
        transactionLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(transactionLabel)
    }
    
    func setupRefLabel() {
        refLabel = UILabel()
        refLabel.textColor = textGray
        refLabel.text = "No. Ref 88891237771"
        refLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        refLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(refLabel)
    }
    
    func setupDoneButton() {
        doneButton = UIButton()
        doneButton.setTitle("DONE", for: .normal)
        doneButton.tintColor = .white
        doneButton.backgroundColor = #colorLiteral(red: 0.7405559421, green: 0.8699820042, blue: 0.5067372322, alpha: 1)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(doneButton)
    }
}
