//
//  HistoryViewController-TableView.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.transactionHistory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let transactionNumber = self.transactionHistory[section].transactions.count
        return transactionNumber
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0 {
            return 70
        } else {
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let historyData = self.transactionHistory[indexPath.section]
        let currentTransaction = historyData.transactions[indexPath.row]
        if indexPath.row == 0 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.descriptionString, for: indexPath) as! HeaderCell
            headerCell.setData(with: historyData)
            return headerCell
        } else {
            let transactionCell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.descriptionString, for: indexPath) as! HistoryCell
            transactionCell.setData(with: currentTransaction)
            return transactionCell
        }
    }
    
    
    
    
}

