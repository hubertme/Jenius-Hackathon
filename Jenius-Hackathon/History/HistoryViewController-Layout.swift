//
//  HistoryViewController-Layout.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension HistoryViewController {
    func layoutUI() {
        self.layoutTransactionContainer()
        self.layoutTransactionDayLabel()
        self.layoutTransactionLabel()
        
        self.layoutHistoryAmountLabel()
        self.layoutDownloadButton()
        self.layoutDownloadImage()
        
    }
    
    private func layoutTransactionContainer() {
        [transactionContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        transactionContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        transactionContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        transactionContainer.heightAnchor.constraint(equalToConstant: 100)].forEach({$0.isActive = true})
    }
    
    private func layoutTransactionDayLabel() {
        [transactionDayLabel.centerXAnchor.constraint(equalTo: transactionContainer.centerXAnchor),
         transactionDayLabel.topAnchor.constraint(equalTo: transactionContainer.topAnchor, constant: 15)].forEach({$0.isActive = true})
    }
    
    private func layoutTransactionLabel() {
        [transactionAmountLabel.topAnchor.constraint(equalTo: transactionDayLabel.bottomAnchor),
         transactionAmountLabel.centerXAnchor.constraint(equalTo: transactionContainer.centerXAnchor)].forEach({$0.isActive = true})
    }
    
    private func layoutHistoryAmountLabel() {
        [historyAmountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
         historyAmountLabel.topAnchor.constraint(equalTo: transactionContainer.bottomAnchor, constant: 15)].forEach({$0.isActive = true})
    }
    
    private func layoutDownloadButton() {
        [downloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
         downloadButton.centerYAnchor.constraint(equalTo: historyAmountLabel.centerYAnchor)].forEach({$0.isActive = true})
    }
    
    private func layoutDownloadImage() {
        [downloadImage.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -3),
        downloadImage.widthAnchor.constraint(equalToConstant: 15),
        downloadImage.heightAnchor.constraint(equalToConstant: 15),
        downloadImage.centerYAnchor.constraint(equalTo: downloadButton.centerYAnchor)].forEach({$0.isActive = true})
    }
}
