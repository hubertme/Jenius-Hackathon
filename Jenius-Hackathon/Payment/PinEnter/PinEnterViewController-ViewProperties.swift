//
//  PinEnterViewController-ViewProperties.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension PinEnterViewController {
    func setupUI() {
        self.setupDotPasswordView()
        self.setupEneterPinLabel()
        
        self.setupForgotPinLabel()
        self.setupUsePasswordButton()
    }
    
    private func setupEneterPinLabel() {
        enterPinLabel = UILabel()
        enterPinLabel.text = "Enter Your PIN"
        enterPinLabel.textColor = .white
        enterPinLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
        enterPinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(enterPinLabel)
    }
    
    private func setupDotPasswordView() {
        dotPasswordView = DotPasswordInput(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.6, height: 40))
        dotPasswordView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(dotPasswordView)
    }
    
    private func setupForgotPinLabel() {
        forgotPinLabel = UILabel()
        forgotPinLabel.text = "Forgot your PIN?"
        forgotPinLabel.textColor = .white
        forgotPinLabel.alpha = 0.9
        forgotPinLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        forgotPinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(forgotPinLabel)
    }
    
    private func setupUsePasswordButton() {
        usePasswordButton = UIButton()
        usePasswordButton.setTitle("USE PASSWORD", for: .normal)
        usePasswordButton.setTitleColor(.white, for: .normal)
        usePasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        usePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(usePasswordButton)
    }
}
