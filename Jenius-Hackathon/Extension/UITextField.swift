//
//  UITextField.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func makeSingleLine() {
        self.borderStyle = .none
        self.layer.backgroundColor = mainColor.cgColor
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.8500000238, green: 0.8500000238, blue: 0.8500000238, alpha: 1)
            ])
    }
    
    func addBottomBorder() {
        self.backgroundColor = .clear
        let borderFrame = CGRect(x: 0, y: self.frame.height-1, width: self.frame.width, height: 1)
        let btmBorder = UIView(frame: borderFrame)
        btmBorder.backgroundColor = #colorLiteral(red: 0.7685593963, green: 0.7686710954, blue: 0.7685348988, alpha: 1)
        
        self.borderStyle = .none
        self.addSubview(btmBorder)
        
        btmBorder.translatesAutoresizingMaskIntoConstraints = false
        btmBorder.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        btmBorder.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        btmBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        btmBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
