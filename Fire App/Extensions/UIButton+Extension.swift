//
//  UIButton+Extension.swift
//  Fire App
//
//  Created by Vince G on 5/29/19.
//  Copyright © 2019 Guillaume Corporations. All rights reserved.
//

import UIKit

extension UIButton {
    public convenience init(title: String, borderColor: UIColor) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString:
            NSAttributedString(string: title, attributes: [NSMutableAttributedString.Key.font:
                UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.setAnchor(width: 0, height: 50)
        
        
    }
}
