//
//  ScrollView.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    private func commonInit() {
        self.showsVerticalScrollIndicator = false
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = true
        self.delegate = self
    }
}

extension ScrollView: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.endEditing(true)
    }
}
