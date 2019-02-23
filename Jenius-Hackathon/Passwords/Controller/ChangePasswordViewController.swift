//
//  ChangePasswordViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChangePasswordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var reNewPasswordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardFromAllTextFields))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupElements()
    }
    
    // MARK: - Actions
    @IBAction func handleDoneButtonTapped(_ sender: UIButton) {
        if isValidDataInputted() {
            
        }
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.view.backgroundColor = mainColor
        
        self.doneButton.clipsToBounds = true
        self.doneButton.layer.cornerRadius = 8
        self.doneButton.setTitleColor(mainColor, for: .normal)
        self.doneButton.alpha = 0.2
        self.doneButton.isUserInteractionEnabled = false
        
        self.currentPasswordTextField.delegate = self
        self.currentPasswordTextField.makeSingleLine()
        self.newPasswordTextField.delegate = self
        self.newPasswordTextField.makeSingleLine()
        self.reNewPasswordTextField.delegate = self
        self.reNewPasswordTextField.makeSingleLine()
    }
    
    private func isValidDataInputted() -> Bool {
        let oldPassword = self.currentPasswordTextField.text!
        let newPassword = self.newPasswordTextField.text!
        let reNewPassword = self.reNewPasswordTextField.text!
        
        if newPassword == oldPassword {
            self.present(createAlertWithOkAction(title: "Same password", message: "Please input a new password that is different from your old one"), animated: true, completion: nil)
            return false
        } else if newPassword.count < 6 {
            self.present(createAlertWithOkAction(title: "Password too short", message: "Please input a 6 characters or more password"), animated: true, completion: nil)
            return false
        } else if newPassword != reNewPassword {
            self.present(createAlertWithOkAction(title: "Password mismatch", message: "Please re-enter your password"), animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @objc private func dismissKeyboardFromAllTextFields() {
        self.currentPasswordTextField.resignFirstResponder()
        self.newPasswordTextField.resignFirstResponder()
        self.reNewPasswordTextField.resignFirstResponder()
        
        self.animateDoneButton()
    }
    
    private func animateDoneButton() {
        if self.currentPasswordTextField.text != "" && self.newPasswordTextField.text != "" && self.reNewPasswordTextField.text != "" {
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

}

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.animateDoneButton()
        textField.resignFirstResponder()
        return true
    }
}
