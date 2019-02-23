//
//  RegisterViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import FirebaseAuth

enum TextFieldOrder: Int {
    case fullName = 0
    case phone = 1
    case email = 2
    case password = 3
    case rePassword = 4
}

class RegisterViewController: UIViewController {
    
    // MARK: - Attributes
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupElements()
    }
    
    // MARK: - Actions
    @IBAction func handleRegisterButtonTapped(_ sender: UIButton) {
        let email = textFields[TextFieldOrder.email.rawValue].text!
        let password = textFields[TextFieldOrder.password.rawValue].text!
        let fullName = textFields[TextFieldOrder.fullName.rawValue].text!
        
        self.handleUserRegistration(email: email, password: password, fullName: fullName)
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.view.backgroundColor = mainColor
        self.containerView.backgroundColor = self.view.backgroundColor
        let tapGestureDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissAllTextFieldsKeyboard))
        self.containerView.addGestureRecognizer(tapGestureDismissKeyboard)
        
        for textField in textFields {
            textField.delegate = self
            textField.makeSingleLine()
        }
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
        toolbar.backgroundColor = .lightGray
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPhoneTextFieldKeyboard))
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) ,doneButton]
        textFields[TextFieldOrder.phone.rawValue].inputAccessoryView = toolbar
        
        self.registerButton.alpha = 0.2
        self.registerButton.isUserInteractionEnabled = false
        self.registerButton.setTitleColor(mainColor, for: .normal)
        self.registerButton.clipsToBounds = true
        self.registerButton.layer.cornerRadius = 8
    }
    
    @objc private func dismissPhoneTextFieldKeyboard() {
        let _ = textFieldShouldReturn(textFields[TextFieldOrder.phone.rawValue])
    }
    
    @objc private func dismissAllTextFieldsKeyboard() {
        for textField in textFields {
            textField.resignFirstResponder()
        }
        
        UIView.animate(withDuration: 1) {
            if self.checkIfAllTextFieldsFilled() {
                self.registerButton.alpha = 1
                self.registerButton.isUserInteractionEnabled = true
            } else {
                self.registerButton.alpha = 0.2
                self.registerButton.isUserInteractionEnabled = false
            }
        }
    }
    
    private func checkIfAllTextFieldsFilled() -> Bool {
        for textField in textFields {
            if textField.text == "" {
                return false
            }
        }
        return true
    }
    
    private func handleUserRegistration(email: String, password: String, fullName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (userAuth, error) in
            if let error = error {
                print("Failed to register with error: \(error.localizedDescription)")
                self.present(createAlertWithOkAction(title: "Failed to register", message: "Please try again"), animated: true, completion: nil)
                return
            }
            print("Successfully registered user with uid: \(userAuth?.user.uid ?? "N/A"), email: \(userAuth?.user.email ?? "N/A") and name: \(userAuth?.user.displayName ?? "N/A")")
            
            self.present(createAlertWithOkAction(title: "Hello Onboard", message: "Welcome to Jenius merchant!") { (_) in
                let nextVC = MainTabBarController()
                self.present(nextVC, animated: true, completion: nil)
            }, animated: true, completion: nil)
        }
    }
}

// MARK: - Extensions
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for idx in textField.tag+1 ..< textFields.count {
            if textFields[idx].text == "" {
                textFields[idx].becomeFirstResponder()
                return true
            }
        }
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 1) {
            if self.checkIfAllTextFieldsFilled() {
                self.registerButton.alpha = 1
                self.registerButton.isUserInteractionEnabled = true
            } else {
                self.registerButton.alpha = 0.2
                self.registerButton.isUserInteractionEnabled = false
            }
        }
        
        return true
    }
}