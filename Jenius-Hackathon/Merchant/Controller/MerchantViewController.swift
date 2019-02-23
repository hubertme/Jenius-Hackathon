//
//  MerchantViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class MerchantViewController: UIViewController {
    
    // MARK: - Attributes
    
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
            return 3
        case 2:
            return 5
        case 3:
            return 2
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
        }
        return UITableViewCell()
    }
    
}

extension MerchantViewController: UITableViewDelegate {
    
}
