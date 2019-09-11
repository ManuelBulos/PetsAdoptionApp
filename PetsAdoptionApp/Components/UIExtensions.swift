//
//  UIExtensions.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

extension UIView {
    
    var padding: CGFloat {
        return 24
    }
    
    func addShadow(offSet: CGSize? = nil, opacity: Float? = nil) {
        if let offSet = offSet {
            layer.shadowOffset = offSet
        } else {
            layer.shadowOffset = CGSize(width: 0, height: 1.0)
        }
        if let opacity = opacity {
            layer.shadowOpacity = opacity
        } else {
            layer.shadowOpacity = 0.2
        }
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
    }
}

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            guard let newValue = newValue else { return }
            let string: String = (self.placeholder != nil ? self.placeholder : "") ?? String()
            self.attributedPlaceholder = NSAttributedString(string: string,
                                                            attributes:[NSAttributedString.Key.foregroundColor: newValue])
        }
    }
}

extension UIScrollView {
    
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            self.setContentOffset(CGPoint(x: 0, y: childStartPoint.y), animated: animated)
        }
    }
    
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if bottomOffset.y > 0 {
            setContentOffset(bottomOffset, animated: animated)
        }
    }
    
}
