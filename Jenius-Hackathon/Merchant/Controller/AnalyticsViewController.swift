//
//  AnalyticsViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class AnalyticsViewController: UIViewController {
    
    let contentTitles = ["Willingness to pay", "Rush hour", "Gender", "Age range", "What's next", "Customer satisfaction"]
    
    // MARK: - Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setupElements()
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.contentTableView.tableFooterView = UIView()
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        
        self.contentTableView.register(TableHeaderCell.nib, forCellReuseIdentifier: TableHeaderCell.cellDescription)
        self.contentTableView.register(AnalyticsContentCell.nib, forCellReuseIdentifier: AnalyticsContentCell.cellDescription)
    }
    
}

extension AnalyticsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitles.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let headerCell = contentTableView.dequeueReusableCell(withIdentifier: TableHeaderCell.cellDescription, for: indexPath) as! TableHeaderCell
            headerCell.merchantNameLabel.text = "Jenius Café"
            headerCell.merchantIdLabel.text = "February 2019"
            return headerCell
        } else if indexPath.row == 4 {
            
        } else if indexPath.row == 5 {
            
        } else {
            let imageCell = contentTableView.dequeueReusableCell(withIdentifier: AnalyticsContentCell.cellDescription, for: indexPath) as! AnalyticsContentCell
            imageCell.criteriaLabel.text = contentTitles[indexPath.row - 1]
            imageCell.chartImageView.image = UIImage(named: "data\(indexPath.row)")
            return imageCell
        }
        return UITableViewCell()
    }
}
