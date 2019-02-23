//
//  MerchantViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import Lottie

class MerchantViewController: UIViewController {
    
    // MARK: - Attributes
    
    // MARK: - Outlets
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = mainColor
        let animationView = LOTAnimationView(name: "LogoAnimation")
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        animationView.contentMode = .scaleAspectFit
        animationView.center = self.view.center
        animationView.loopAnimation = true
        
        self.view.addSubview(animationView)
        animationView.play()
    }
    
    // MARK: - Actions
    
    // MARK: - Private methods

}
