//
//  PinEnterViewController.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class PinEnterViewController: UIViewController {
    
    var numbersData = [1,2,3,4,5,6,7,8,9,0]
    
    var enterPinLabel: UILabel!
    var dotPasswordView: DotPasswordInput!
    
    var forgotPinLabel: UILabel!
    var usePasswordButton: UIButton!
    
    var numberInputView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numbersData.shuffle()
        self.setupUI()
        self.layoutUI()
        
        self.view.backgroundColor = mainColor
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addJeniusCoCreateLogo(self)
        self.setupLogoImage()
    }
    
}

class DotPasswordInput: UIView {
    
    var dotViews = [UIView]()
    var counter = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.generateDots()
    }
    
    func addPass() {
        if counter < dotViews.count {
            dotViews[counter].alpha = 1
            dotViews[counter].backgroundColor = .white
            counter = counter >= 5 ? 5 : counter+1
        }
    }
    
    func deletePass() {
        if counter >= 0 {
            dotViews[counter].backgroundColor = .black
            dotViews[counter].alpha = 0.3
            counter = counter < 0 ? 0 : counter-1
        }
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

class PinInputView: UIView {
    
    var numbers = [1,2,3,4,5,6,7,8,9,0]
    var buttons = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        numbers.shuffle()
        
        self.generateButtons()
    }
    
    func generateButtons() {
        let w = self.frame.width
        let h = self.frame.height
        for (num, i) in numbers.enumerated() {
            let xPos = CGFloat(i).truncatingRemainder(dividingBy: 3) * (w / 3)
            let yPos = (CGFloat(i) - xPos) / 3
            let btn = UIButton()
            btn.setTitle("\(num)", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.frame = CGRect(x: xPos, y: yPos, width: w / 3, height: h / 4)
            buttons.append(btn)
            
            self.addSubview(btn)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
