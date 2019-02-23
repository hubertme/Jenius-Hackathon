//
//  RegisterViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

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
        
        self.registerButton.setTitleColor(mainColor, for: .normal)
    }
    
    @objc private func dismissPhoneTextFieldKeyboard() {
        let _ = textFieldShouldReturn(textFields[TextFieldOrder.phone.rawValue])
    }
    
    @objc private func dismissAllTextFieldsKeyboard() {
        for textField in textFields {
            textField.resignFirstResponder()
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
            textField.resignFirstResponder()
        }
        return true
    }
}
