//
//  HistoryCellk.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var refLabel: UILabel!
    var dateLabel: UILabel!
    var transactionLabel: UILabel!
    
    static var descriptionString: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        refLabel = UILabel()
        refLabel.text = ""
        refLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        refLabel.textColor = textGray
        refLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(refLabel)
        
        dateLabel = UILabel()
        dateLabel.text = ""
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        dateLabel.textColor = textGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateLabel)
        
        transactionLabel = UILabel()
        transactionLabel.text = ""
        transactionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        transactionLabel.textColor = textGray
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(transactionLabel)
    }
    
    func layoutUI() {
        [refLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
         refLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10)].forEach({$0.isActive = true})
        
        [dateLabel.leadingAnchor.constraint(equalTo: refLabel.leadingAnchor),
         dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)].forEach({$0.isActive = true})
        
        [transactionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
         transactionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)].forEach({$0.isActive = true})
    }
    
    func setData(with data: Transaction) {
        self.refLabel.text = "No. Ref \(data.refNum ?? "0")"
        self.dateLabel.text = data.dateString()
        self.transactionLabel.text = "\(data.total ?? 0)"
    }
}
