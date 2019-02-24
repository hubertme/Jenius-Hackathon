//
//  ForgetPasswordViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgetPasswordViewController: UIViewController {
    
    // MARK: - Attributes
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissAllKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupElements()
    }
    
    // MARK: - Actions
    @IBAction func handleDoneButtonTapped(_ sender: UIButton) {
        let email = self.emailTextField.text!
        if isValidEmail(email) {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    print("Error sending email with \(error.localizedDescription)")
                    self.present(createAlertWithOkAction(title: "Inactive email", message: "Please enter an active email or register if you never registered to Jenius Merchant"), animated: true, completion: nil)
                    return
                }
                self.present(createAlertWithOkAction(title: "Email sent", message: "Please check your mailbox for the complete instruction to reset your password", { (_) in
                    self.navigationController?.popToRootViewController(animated: true)
                }), animated: true, completion: nil)
            }
        } else {
            self.present(createAlertWithOkAction(title: "Inavlid email format", message: "Please enter a valid email format") { (_) in
                self.emailTextField.text = ""
                self.emailTextField.becomeFirstResponder()
            }, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.view.backgroundColor = mainColor
        
        self.emailTextField.makeSingleLine()
        self.emailTextField.delegate = self
        
        self.doneButton.setTitleColor(mainColor, for: .normal)
        self.doneButton.clipsToBounds = true
        self.doneButton.layer.cornerRadius = 8
        self.doneButton.alpha = 0.2
        self.doneButton.isUserInteractionEnabled = false
    }
    
    private func animateDoneButton() {
        if self.emailTextField.text != "" {
            UIView.animate(withDuration: 1) {
                self.doneButton.alpha = 1
                self.doneButton.isUserInteractionEnabled = true
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.doneButton.alpha = 0.2
                self.doneButton.isUserInteractionEnabled = false
            }
        }
    }
    
    @objc private func dismissAllKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.animateDoneButton()
    }
}

extension ForgetPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.animateDoneButton()
        textField.resignFirstResponder()
        return true
    }
}
