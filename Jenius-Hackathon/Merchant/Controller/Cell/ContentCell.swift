//
//  ContentCell.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {
    
    // MARK: - Cell's static
    static var cellDescription: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var criteriaLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupElements()
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.criteriaLabel.sizeToFit()
        self.contentLabel.sizeToFit()
    }
    
}
