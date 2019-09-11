//
//  RoundedButton.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/8/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.regular
        self.backgroundColor = UIColor.primaryColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
    }
}
