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
        if self.emailTextField.text == "" {
            let emptyEmailAlert = createAlertWithOkAction(title: "Empty email", message: "Please enter your registered email") { (_) in
                self.emailTextField.becomeFirstResponder()
            }
            self.present(emptyEmailAlert, animated: true, completion: nil)
            
        } else if self.passwordTextField.text == "" {
            let emptyPasswordAlert = createAlertWithOkAction(title: "Empty password", message: "Please enter your password in order to sign in") { (_) in
                self.passwordTextField.becomeFirstResponder()
            }
            self.present(emptyPasswordAlert, animated: true, completion: nil)
            
        } else {
            self.handleSignInWith(email: self.emailTextField.text!, password: self.passwordTextField.text!)
        }
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
        
        self.signInButton.setTitleColor(mainColor, for: .normal)
    }
    
    @objc private func dismissAllTextFieldsKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
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
//                strongSelf.navigationController?.pushViewController(nextVC, animated: true)
                strongSelf.present(nextVC, animated: true, completion: nil)
            }, animated: true, completion: nil)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            let _ = self.passwordTextField.text == "" ? self.passwordTextField.becomeFirstResponder() : textField.resignFirstResponder()
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
