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
}
