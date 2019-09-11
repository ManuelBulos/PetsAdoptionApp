//
//  NavigationController.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.tintColor = UIColor.navigationBarItems
        self.navigationBar.prefersLargeTitles = false
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }
}
