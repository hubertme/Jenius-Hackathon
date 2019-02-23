//
//  LoginViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import FirebaseAuth

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
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Actions
    @IBAction func handleSignInButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        self.handleSignInWith(email: email, password: password)
    }
    
    @IBAction func handleRegisterButtonTapped(_ sender: UIButton) {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
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
        
        self.signInButton.alpha = 0.2
        self.signInButton.isUserInteractionEnabled = false
        self.signInButton.setTitleColor(mainColor, for: .normal)
        self.signInButton.clipsToBounds = true
        self.signInButton.layer.cornerRadius = 8
    }
    
    @objc private func dismissAllTextFieldsKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        
        UIView.animate(withDuration: 1) {
            if self.checkIfAllTextFieldsFilled() {
                self.signInButton.alpha = 1
                self.signInButton.isUserInteractionEnabled = true
            } else {
                self.signInButton.alpha = 0.2
                self.signInButton.isUserInteractionEnabled = false
            }
        }
    }
    
    private func handleSignInWith(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                print("Error signing in with: \(error.localizedDescription)")
                strongSelf.present(createAlertWithOkAction(title: "Error in signing in", message: "Please retry logging in"), animated: true, completion: nil)
                return
            }
            strongSelf.present(createAlertWithOkAction(title: "Signing in", message: "Welcome to Jenius merchant!") { (_) in
                let nextVC = MainTabBarController()
                strongSelf.present(nextVC, animated: true, completion: nil)
            }, animated: true, completion: nil)
        }
    }
    
    private func checkIfAllTextFieldsFilled() -> Bool {
        if self.emailTextField.text != "" && self.passwordTextField.text != "" {
            return true
        }
        return false
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            let _ = self.passwordTextField.text == "" ? self.passwordTextField.becomeFirstResponder() : textField.resignFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        UIView.animate(withDuration: 1) {
            if self.checkIfAllTextFieldsFilled() {
                self.signInButton.alpha = 1
                self.signInButton.isUserInteractionEnabled = true
            } else {
                self.signInButton.alpha = 0.2
                self.signInButton.isUserInteractionEnabled = false
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.emailTextField {
            textField.returnKeyType = self.passwordTextField.text == "" ? .next : .done
        }
    }
}
