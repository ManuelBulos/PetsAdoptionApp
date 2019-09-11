//
//  TagSelectorView.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/8/19.
//  Copyright © 2019 manuelbulos. All rights reserved.
//

import UIKit

struct Tag {
    let name: String
    let icon: UIImage?
    
    static let testObjects = [Tag(name: "Cats", icon: UIImage.petTypeCat),
                              Tag(name: "Dogs", icon: UIImage.petTypeDog),
                              Tag(name: "Birds", icon: UIImage.petTypeBird)]
}

class TagSelectorView: UIView {
    
    private lazy var collectionView: CollectionView = {
        let collectionView = CollectionView(frame: bounds, controller: self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
        return collectionView
    }()
    
    private var tags: [Tag] = [Tag]()
    
    private (set) var selectedIndex: IndexPath = IndexPath() {
        didSet {
            self.onSelectionChange?(selectedIndex)
        }
    }
    
    var onSelectionChange: ((IndexPath) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow(offSet: CGSize(width: 0, height: -6), opacity: 0.05)
    }
    
    private func addSubviews() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func setItems(_ tags: [Tag]) {
        self.tags = tags
        self.collectionView.reloadData()
    }
    
    func selectItem(at indexPath: IndexPath, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.collectionView.selectItem(at: indexPath,
                                           animated: animated,
                                           scrollPosition: .centeredHorizontally)
        }
    }
}

extension TagSelectorView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedCell = collectionView.cellForItem(at: selectedIndex)
        previousSelectedCell?.isSelected = false
        
        let newSelectedCell =  collectionView.cellForItem(at: indexPath)
        newSelectedCell?.isSelected = true

        selectedIndex = indexPath
    }
}

extension TagSelectorView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.customTag = tags[indexPath.row]
        return cell
    }
}

extension TagSelectorView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = (collectionView.frame.width / 3)
        return CGSize(width: width, height:height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
