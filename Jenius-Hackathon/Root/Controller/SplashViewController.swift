//
//  ViewController.swift
//  Jenius-Hackathon
//
//  Created by Hubert Wang on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = mainColor
        addLottieAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
            let loginVC = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    private func addLottieAnimation() {
        let animationView = LOTAnimationView(name: "LogoAnimation")
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        animationView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        animationView.contentMode = .scaleAspectFit
        animationView.center = self.view.center
        animationView.loopAnimation = false
        
        self.view.addSubview(animationView)
        animationView.play()
    }
    
}

