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

        self.setupHistoryAmountLabel()
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
        transactionDayLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        transactionDayLabel.textColor = .white
        transactionDayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.transactionContainer.addSubview(transactionDayLabel)
    }
    
    private func setupTransactionLabel() {
        transactionAmountLabel = UILabel()
        transactionAmountLabel.text = "Rp 2.000.231"
        transactionAmountLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        transactionAmountLabel.textColor = .white
        transactionAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.transactionContainer.addSubview(transactionAmountLabel)
    }
    
    //MARK: DOWNLOAD
    private func setupHistoryAmountLabel() {
        historyAmountLabel = UILabel()
        historyAmountLabel.text = "Showing 10 of 14"
        historyAmountLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        historyAmountLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        historyAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(historyAmountLabel)
    }
    
    private func setupDownloadButton() {
        downloadButton = UIButton()
        downloadButton.setTitle("DOWNLOAD", for: .normal)
        downloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        downloadButton.setTitleColor(#colorLiteral(red: 0.5804243684, green: 0.6846458316, blue: 0.31968683, alpha: 1), for: .normal)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(downloadButton)
    }
}
