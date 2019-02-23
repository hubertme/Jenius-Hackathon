//
//  HeaderCell.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    var dateLabel: UILabel!
    
    static var descriptionString: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.backgroundColor = #colorLiteral(red: 0.8979603648, green: 0.8980897069, blue: 0.8979321122, alpha: 1)
    }
    
    func setupUI() {
        dateLabel = UILabel()
        dateLabel.text = ""
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dateLabel.textColor = textGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dateLabel)
        
        [dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)].forEach({$0.isActive = true})
    }
    
    func setData(with data: HistoryData) {
        
        self.dateLabel.text = data.dateString()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
