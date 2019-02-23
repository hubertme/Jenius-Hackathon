//
//  Extensions.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension UITextField {
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
