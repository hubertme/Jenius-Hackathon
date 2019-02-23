//
//  HistoryData.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import Foundation

struct HistoryData {
    var month: Date?
    var transactions: [Transaction]
    
    init(month: Date?, transactions: [Transaction]) {
        self.month = month
        self.transactions = transactions
    }
    
    func dateString() -> String {
        guard let transactionDate = self.month else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: transactionDate)
    }
}

struct Transaction {
    var refNum: String?
    var date: Date?
    var total: Int?
    
    init(refNum: String?, datePurchased: Date?, total: Int?) {
        self.refNum = refNum
        self.date = datePurchased
        self.total = total
    }
    
    func dateString() -> String {
        guard let transactionDate = self.date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy - hh.mm a"
        return dateFormatter.string(from: transactionDate)
    }
}
