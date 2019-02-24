//
//  ForgetPasswordViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    // MARK: - Attributes
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupElements()
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
}

extension ForgetPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.animateDoneButton()
        textField.resignFirstResponder()
        return true
    }
}
