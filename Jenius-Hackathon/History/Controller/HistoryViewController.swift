//
//  HistoryViewController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController { 
    
    var transactionContainer: UIView!
    var transactionDayLabel: UILabel!
    var transactionAmountLabel: UILabel!
    
    var historyAmountLabel: UILabel!
    var downloadImage: UIImageView!
    var downloadButton: UIButton!
    
    var historyTableView: UITableView!
    
    var transactionHistory = [HistoryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupUI()
        self.layoutUI()
    }
    
    func setupHistoryData() {
        let transactionList = [
            Transaction(refNum: "12312312300123", datePurchased: Date(), total: <#T##Int?#>)
        ]
    }
    
    
}
