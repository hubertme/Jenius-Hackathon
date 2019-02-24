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
        addJeniusCoCreateLogo(self)
        self.setupElements()
    }
    
    // MARK: - Actions
    @IBAction func handleDoneButtonTapped(_ sender: UIButton) {
        
        let oldPassword = self.currentPasswordTextField.text!
        let newPassword = self.newPasswordTextField.text!
        let reNewPassword = self.reNewPasswordTextField.text!
        
        if isValidDataInputted(oldPassword: oldPassword, newPassword: newPassword, reNewPassword: reNewPassword) {
            if let email = Auth.auth().currentUser?.email {
                changeUserPassword(email: email, oldPassword: oldPassword, newPassword: newPassword)
            }
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
    
    private func isValidDataInputted(oldPassword: String, newPassword: String, reNewPassword: String) -> Bool {
        
        if newPassword == oldPassword {
            self.present(createAlertWithOkAction(title: "Same password", message: "Please input a new password that is different from your old one") { (_) in
                self.newPasswordTextField.text = ""
                self.reNewPasswordTextField.text = ""
                self.newPasswordTextField.becomeFirstResponder()
            }, animated: true, completion: nil)
            
            return false
        } else if newPassword.count < 6 {
            self.present(createAlertWithOkAction(title: "Password too short", message: "Please input a 6 characters or more password") { (_) in
                self.newPasswordTextField.text = ""
                self.reNewPasswordTextField.text = ""
                self.newPasswordTextField.becomeFirstResponder()
            }, animated: true, completion: nil)
            
            return false
        } else if newPassword != reNewPassword {
            self.present(createAlertWithOkAction(title: "Password mismatch", message: "Please re-enter your password") { (_) in
                self.reNewPasswordTextField.text = ""
                self.reNewPasswordTextField.becomeFirstResponder()
            }, animated: true, completion: nil)
            
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
    
    private func changeUserPassword(email: String, oldPassword: String, newPassword: String) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: oldPassword)
        Auth.auth().currentUser?.reauthenticateAndRetrieveData(with: credential, completion: { (userAuth, error) in
            if let error = error {
                print("Error reauthenticating user with error: \(error.localizedDescription)")
                self.present(createAlertWithOkAction(title: "Wrong credential", message: "Please enter your old password correctly") { (_) in
                    self.currentPasswordTextField.text = ""
                    self.currentPasswordTextField.becomeFirstResponder()
                }, animated: true, completion: nil)
                
                return
            }
            Auth.auth().currentUser?.updatePassword(to: newPassword, completion: { (error) in
                if let error = error {
                    print("Error in changing password with error: \(error.localizedDescription)")
                    self.present(createAlertWithOkAction(title: "An unknown error occured", message: "Please try again later"), animated: true, completion: nil)
                    return
                }
                self.present(createAlertWithOkAction(title: "Success changed password!", message: "We recommend you to sign out and sign in again") { (_) in
                    self.navigationController?.popViewController(animated: true)
                }, animated: true, completion: nil)
            })
        })
    }

}

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.animateDoneButton()
        textField.resignFirstResponder()
        return true
    }
}
