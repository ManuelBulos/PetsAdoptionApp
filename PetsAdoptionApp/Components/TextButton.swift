//
//  TextButton.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/8/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class TextButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.setTitleColor(UIColor.textButton, for: .normal)
        self.titleLabel?.font = UIFont.light
    }
}
