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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        refLabel = UILabel()
        refLabel.text = ""
        refLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        refLabel.textColor = textGray
        refLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel = UILabel()
        dateLabel.text = ""
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        dateLabel.textColor = textGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        transactionLabel = UILabel()
        transactionLabel.text = ""
        transactionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        transactionLabel.textColor = textGray
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layoutUI() {
        [refLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
         refLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -5)].forEach({$0.isActive = true})
        
        dateLabel.leadingAnchor.constraint(equalTo: refLabel.leadingAnchor)
    }
}
