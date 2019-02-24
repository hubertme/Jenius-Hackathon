//
//  AnalyticsContentCell.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class AnalyticsContentCell: UITableViewCell {
    
    // MARK: - Cell's static
    static var cellDescription: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
