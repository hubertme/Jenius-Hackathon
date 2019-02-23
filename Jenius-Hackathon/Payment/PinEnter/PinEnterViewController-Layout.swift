//
//  PinEnterViewController-Layout.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension PinEnterViewController {
    func layoutUI() {
        self.layoutDotPasswordView()
        self.layoutEnterPinLabel()
        
        self.layoutForgotPinLabel()
    }
    
    private func layoutEnterPinLabel() {
        [enterPinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         enterPinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80)].forEach({$0.isActive = true})
    }
    
    private func layoutDotPasswordView() {
        [dotPasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         dotPasswordView.topAnchor.constraint(equalTo: enterPinLabel.bottomAnchor, constant: 30),
         dotPasswordView.widthAnchor.constraint(equalToConstant: dotPasswordView.frame.width),
         dotPasswordView.heightAnchor.constraint(equalToConstant: dotPasswordView.frame.height)].forEach({$0.isActive = true})
    }
    
    private func layoutForgotPinLabel() {
        [forgotPinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         forgotPinLabel.topAnchor.constraint(equalTo: dotPasswordView.bottomAnchor, constant: 30)].forEach({$0.isActive = true})
    }
}
