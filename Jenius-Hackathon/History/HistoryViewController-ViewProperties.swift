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
        self.setupTransactionDayLabel()
        self.setupTransactionLabel()
        
        self.setupHistoryListLabel()
        self.setupDownloadButton()
    }
    
    //MARK: TOP
    private func setupTransactionContainer() {
        transactionContainer = UIView()
        transactionContainer.backgroundColor = mainColor
        transactionContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(transactionContainer)
    }
    
    private func setupTransactionDayLabel() {
        transactionDayLabel = UILabel()
        transactionDayLabel.text = "Today's Transaction"
        transactionDayLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        transactionDayLabel.textColor = .white
        transactionDayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.transactionContainer.addSubview(transactionDayLabel)
    }
    
    private func setupTransactionLabel() {
        transactionAmountLabel = UILabel()
        transactionAmountLabel.text = "Rp 2.000.231"
        transactionAmountLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        transactionAmountLabel.textColor = .white
        transactionAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.transactionContainer.addSubview(transactionAmountLabel)
    }
    
    private func setupHistoryListLabel() {
        historyListLabel = UILabel()
        historyListLabel.text = "Showing 10 of 14"
        historyListLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        historyListLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        historyListLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(historyListLabel)
    }
    
    private func setupDownloadButton() {
        downloadButton = UIButton()
        downloadButton.setTitle("DOWNLOAD", for: .normal)
        downloadButton.setTitleColor(#colorLiteral(red: 0.5804243684, green: 0.6846458316, blue: 0.31968683, alpha: 1), for: .normal)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(downloadButton)
    }
}
