//
//  Label.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class Label: UILabel {
    convenience init(frame: CGRect, text: String? = nil, textColor: UIColor, textAlignment: NSTextAlignment? = nil, font: UIFont?, multiline: Bool) {
        self.init(frame: frame)
        self.textAlignment = textAlignment ?? .left
        self.textColor = textColor
        self.text = text
        self.font = font
        if multiline {
            self.numberOfLines = 0
        } else {
            self.adjustsFontSizeToFitWidth = true
        }
    }
}
