//
//  Functions.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import Foundation
import UIKit

/**
 Create an alert with only one ok (confirmation action)
 - Parameters:
    - title: The alert controller title
    - message: The alert's body message
    - okTitle: The completion action title (default is 'Ok')
    - completion: Action to be added when ok button is tapped
 
 - Returns: An alert controller with inputted parameters
 */
func createAlertWithOkAction(title: String, message: String, okTitle: String = "Ok", _ completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: okTitle, style: .default, handler: completion)
    alertController.addAction(okAction)
    
    let notification = UINotificationFeedbackGenerator()
    notification.notificationOccurred(.success)
    
    return alertController
}

/**
 Evaluate email based on regular expression whether the email inputted is a valid email or not
 - Parameters:
    - sender: Email in string that will be evaluated
 
 - Returns: Boolean value according to email evaluation
 */
func isValidEmail(_ sender: String) -> Bool {
    let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
    return emailTest.evaluate(with: sender)
}
