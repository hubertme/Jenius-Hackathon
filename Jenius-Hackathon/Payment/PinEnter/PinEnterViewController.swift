//
//  PinEnterViewController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class PinEnterViewController: UIViewController {
    
    var enterPinLabel: UILabel!
    var dotPasswordView: DotPasswordInput!
    
    var forgotPinLabel: UILabel!
    var usePasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.layoutUI()
        
        self.view.backgroundColor = mainColor
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupLogoImage()
    }
    
}

class DotPasswordInput: UIView {
    
    var dotViews = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.generateDots()
    }
    
    func generateDots() {
        let size: CGFloat = 15
        for i in 0...5 {
            let dot = UIView()
            let xPos: CGFloat = CGFloat(i) * self.frame.width/5
            dot.frame = CGRect(x: xPos - size/2, y: self.frame.height / 2, width: size, height: size)
            dot.layer.cornerRadius = dot.frame.width / 2
            dot.backgroundColor = .black
            dot.alpha = 0.3
            dotViews.append(dot)
            self.addSubview(dot)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
