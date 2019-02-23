//
//  PinEnterViewController-CollectionView.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 24/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

extension PinEnterViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as! NumberCell
        cell.numberLabel.text = "\(numbersData[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: collectionView.frame.height / 4)
    }
}

class NumberCell: UICollectionViewCell {
    var numberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    func setupUI() {
        numberLabel = UILabel()
        numberLabel.text = "9"
        numberLabel.textColor = .white
        numberLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(numberLabel)
        
        numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
