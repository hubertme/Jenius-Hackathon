//
//  HistoryViewController-ViewProperties.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension HistoryViewController {
    func setupUI() {
        self.setupTransactionContainer()
    }
    
    func setupTransactionContainer() {
        transactionContainer = UIView()
        transactionContainer.backgroundColor = mainColor
        transactionContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(transactionContainer)
    }
    
    private func setupTransactionDayLabel() {
        transactionDayLabel = UILabel()
        transactionDayLabel.text = "Today's Transaction"
        
    }
    
    private func setupTransactionLabel() {
        
    }
}
