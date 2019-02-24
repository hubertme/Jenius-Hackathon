//
//  PaymentViewController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    var titleContainer: UIView!
    var titleLabel: UILabel!
    var merchantIcon: UIImageView!

    var inputLabel: UILabel!
    var inputDesc: UILabel!
    var amountTextField: UITextField!

    var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.setupUI()
        self.layoutUI()
        
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        
        let tapGestureDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissAllKeyboards))
        self.view.addGestureRecognizer(tapGestureDismissKeyboard)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addJeniusCoCreateLogo(self)
        self.setupLogoImage()
    }
    
    @objc func handleNextButton() {
        if enteredAmountIsValid() {
            guard let amount = Int(amountTextField.text!) else {
                let alert = createAlertWithOkAction(title: "We are sorry", message: "Please enter the valid amount")
                self.present(alert, animated: true)
                return
            }
            let confirmationVC = ConfirmationViewController()
            confirmationVC.enteredAmount = amount
            self.navigationController?.pushViewController(confirmationVC, animated: true)
        }
    }
    
    func enteredAmountIsValid() -> Bool {
        return amountTextField.text != nil || amountTextField.text != "0"
    }
}

extension PaymentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissAllKeyboards() {
        self.amountTextField.resignFirstResponder()
    }
}
