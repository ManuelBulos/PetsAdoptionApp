//
//  Colors.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

extension UIColor {
    static let navigationBarItems = UIColor(r: 29, g: 47, b: 98)
    static let primaryColor = UIColor(r: 28, g: 12, b: 51)
    static let accent = UIColor(r: 0, g: 124, b: 141)
    static let textButton = UIColor(r: 140, g: 152, b: 176)
    static let recommendedColor1 = UIColor(r: 242, g: 242, b: 251)
    static let recommendedColor2 = UIColor(r: 225, g: 214, b: 252)
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
