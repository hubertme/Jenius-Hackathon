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
        ["Change password", "Authorized devices", "My merchant analytics"],
        ["Log out"],
    ]
    
    // MARK: - Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addJeniusCoCreateLogo(self)
    }
    
    // MARK: - Actions
    
    // MARK: - Private methods
    private func setupElements() {
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        self.contentTableView.tableFooterView = UIView()
        self.contentTableView.bounces = false
        
        self.contentTableView.register(TableHeaderCell.nib, forCellReuseIdentifier: TableHeaderCell.cellDescription)
        self.contentTableView.register(ContentCell.nib, forCellReuseIdentifier: ContentCell.cellDescription)
    }
    
    private func signOutCurrentUser() {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch {
            print("Error signing out with error \(error.localizedDescription)")
        }
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
            let headerCell = contentTableView.dequeueReusableCell(withIdentifier: TableHeaderCell.cellDescription, for: indexPath) as! TableHeaderCell
            headerCell.merchantNameLabel.text = "Jenius Café"
            headerCell.merchantIdLabel.text = "Merchant ID: 50024014069"
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
                contentCell.selectionStyle = .default
                contentCell.contentLabel.alpha = 0
                contentCell.criteriaLabel.text = contentTitle[2][indexPath.row-1]
                contentCell.criteriaLabel.textColor = .red
            }
            
            return contentCell
            
        }
    }
    
}

extension MerchantViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            if indexPath.section == 2 {
                if indexPath.row == 1 {
                    let nextVC = ChangePasswordViewController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                } else if indexPath.row == 3 {
                    let analyticsVC = AnalyticsViewController()
                    self.navigationController?.pushViewController(analyticsVC, animated: true)
                }
            } else if indexPath.section == 3 {
                let alertController = createAlertWithOkAction(title: "Leave?", message: "Are you sure want to sign out?", okTitle: "Yes", { (_) in
                    self.signOutCurrentUser()
                })
                let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: {
                    tableView.deselectRow(at: indexPath, animated: true)
                })
            }
        }
    }
}
