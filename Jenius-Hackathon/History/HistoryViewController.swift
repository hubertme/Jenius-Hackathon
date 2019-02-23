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
    
    var showingLabel: UILabel!
    var downloadButton: UIButton!
    
    var transactionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupLogoImage()
    }
}
