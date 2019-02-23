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
        self.layoutUsePasswordButton()
        
        self.layoutNumberInput()
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
    
    private func layoutUsePasswordButton() {
        [usePasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         usePasswordButton.topAnchor.constraint(equalTo: forgotPinLabel.bottomAnchor, constant: 5)].forEach({$0.isActive = true})
    }
    
    private func layoutNumberInput() {
        [numberInputView.topAnchor.constraint(equalTo: usePasswordButton.bottomAnchor, constant: 10),
         numberInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         numberInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         numberInputView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
}
