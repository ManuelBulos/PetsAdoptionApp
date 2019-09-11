//
//  TagCell.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/9/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = containerBackgroundColor
        return containerView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = imageTintColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: Label = {
        let titleLabel = Label(frame: bounds,
                               textColor: UIColor.white,
                               textAlignment: .center,
                               font: UIFont.light,
                               multiline: false)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isHidden = true
        return titleLabel
    }()
    
    var imageTintColor = UIColor.gray
    
    var imageSelectedTintColor = UIColor.white
    
    var containerBackgroundColor = UIColor.clear
    
    var containerSelectedBackgroundColor = UIColor.primaryColor
    
    var customTag: Tag? {
        didSet {
            guard let customTag = customTag else { return }
            imageView.image = customTag.icon?.withRenderingMode(.alwaysTemplate)
            titleLabel.text = customTag.name
        }
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.alpha = self.isSelected ? 1.0 : 0.0
                self.titleLabel.isHidden = self.isSelected ? false : true
                self.imageView.tintColor = self.isSelected ? self.imageSelectedTintColor : self.imageTintColor
                self.containerView.backgroundColor = self.isSelected ?  self.containerSelectedBackgroundColor : self.containerBackgroundColor
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.height / 2
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
            ])
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 4),
            stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
            ])
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
    }
}
