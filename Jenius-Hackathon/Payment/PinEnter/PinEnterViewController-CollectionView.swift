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
        return numbersData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row != numbersData.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as! NumberCell
            cell.numberLabel.text = "\(numbersData[indexPath.row])"
            return cell
        } else {
            let deleteCell = collectionView.dequeueReusableCell(withReuseIdentifier: "deleteCell", for: indexPath) as! DeleteButtonCell
            return deleteCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: collectionView.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != numbersData.count {
            let cell = collectionView.cellForItem(at: indexPath) as! NumberCell
            print(cell.numberLabel.text)
            dotPasswordView.addPass()
            
            if dotPasswordView.counter == 5 {
                self.navigationController?.pushViewController(TransactionCheckViewController(), animated: true)
            }
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! DeleteButtonCell
            dotPasswordView.deletePass()
        }
        
    }
}

class DeleteButtonCell: UICollectionViewCell {
    var deleteButton: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    func setupUI() {
        let deleteIcon = UIImage(named: "icon_back")?.withRenderingMode(.alwaysTemplate)
        deleteButton = UIImageView(image: deleteIcon)
        deleteButton.tintColor = .white
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(deleteButton)
        
        deleteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
