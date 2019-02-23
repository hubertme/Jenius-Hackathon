//
//  MerchantViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import FirebaseAuth

class MerchantViewController: UIViewController {
    
    // MARK: - Attributes
    let contentTitle: [[String]] = [
        ["Email", "Phone"],
        ["Change password", "Authorized devices"],
        ["Log out"],
    ]
    
    // MARK: - Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupElements()
    }
    
    // MARK: - Actions
    
    // MARK: - Private methods
    private func setupElements() {
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        
        self.contentTableView.register(HeaderCell.nib, forCellReuseIdentifier: HeaderCell.cellDescription)
        self.contentTableView.register(ContentCell.nib, forCellReuseIdentifier: ContentCell.cellDescription)
    }
}

extension MerchantViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return contentTitle[0].count + 1
        case 2:
            return contentTitle[1].count + 1
        case 3:
            return contentTitle[2].count + 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.section != 0 && indexPath.row == 0) ? 50 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let headerCell = contentTableView.dequeueReusableCell(withIdentifier: HeaderCell.cellDescription, for: indexPath) as! HeaderCell
            headerCell.merchantNameLabel.text = "Jenius Café"
            headerCell.merchantIdLabel.text = "50024014069"
            headerCell.selectionStyle = .none
            return headerCell
            
        } else if indexPath.row == 0 {
            let sectionHeaderCell = UITableViewCell(style: .default, reuseIdentifier: "sectionHeaderCell")
            sectionHeaderCell.textLabel?.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            sectionHeaderCell.backgroundColor = #colorLiteral(red: 0.8500000238, green: 0.8500000238, blue: 0.8500000238, alpha: 1)
            sectionHeaderCell.selectionStyle = .none
            
            switch indexPath.section {
            case 1:
                sectionHeaderCell.textLabel?.text = "Merchant information"
            case 2:
                sectionHeaderCell.textLabel?.text = "Settings"
            default:
                sectionHeaderCell.textLabel?.text = ""
            }
            
            return sectionHeaderCell
            
        } else {
            let contentCell = contentTableView.dequeueReusableCell(withIdentifier: ContentCell.cellDescription, for: indexPath) as! ContentCell
            contentCell.selectionStyle = .none
            
            if indexPath.section == 1 {
                contentCell.criteriaLabel.text = contentTitle[0][indexPath.row-1]
                contentCell.contentLabel.text = indexPath.row == 1 ? (Auth.auth().currentUser?.email ?? "No email found") : "628123456789"
            } else if indexPath.section == 2 {
                contentCell.contentLabel.alpha = 0
                contentCell.criteriaLabel.text = contentTitle[1][indexPath.row-1]
                contentCell.accessoryType = .disclosureIndicator
            } else if indexPath.section == 3 {
                contentCell.contentLabel.alpha = 0
                contentCell.criteriaLabel.text = contentTitle[2][indexPath.row-1]
                contentCell.criteriaLabel.textColor = .red
            }
            
            return contentCell
            
        }
    }
    
}

extension MerchantViewController: UITableViewDelegate {
    
}
