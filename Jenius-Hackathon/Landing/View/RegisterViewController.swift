//
//  RegisterViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Attributes
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    
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
    }
}
