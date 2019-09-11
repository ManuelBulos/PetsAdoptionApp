//
//  CollectionView.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/8/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    init(frame: CGRect, controller: UICollectionViewDelegate & UICollectionViewDataSource) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.dataSource = controller
        self.delegate = controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
