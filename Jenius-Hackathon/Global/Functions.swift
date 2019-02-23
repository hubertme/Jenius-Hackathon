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
