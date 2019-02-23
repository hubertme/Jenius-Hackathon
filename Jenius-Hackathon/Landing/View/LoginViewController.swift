//
//  LoginViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Attributes
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupElements()
    }
    
    // MARK: - Actions
    @IBAction func handleSignInButtonTapped(_ sender: UIButton) {
        print("Sign in button tapped!")
    }
    
    @IBAction func handleRegisterButtonTapped(_ sender: UIButton) {
        print("Register button tapped!")
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.view.backgroundColor = mainColor
        let tapGestureDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissAllTextFieldsKeyboard))
        self.view.addGestureRecognizer(tapGestureDismissKeyboard)
        
        self.emailTextField.makeSingleLine()
        self.emailTextField.delegate = self
        self.emailTextField.autocorrectionType = .no
        self.passwordTextField.makeSingleLine()
        self.passwordTextField.delegate = self
        
        self.signInButton.setTitleColor(mainColor, for: .normal)
    }
    
    @objc private func dismissAllTextFieldsKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            self.passwordTextField.text == "" ? self.passwordTextField.becomeFirstResponder() : textField.resignFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.emailTextField {
            textField.returnKeyType = self.passwordTextField.text == "" ? .next : .done
        }
    }
}
