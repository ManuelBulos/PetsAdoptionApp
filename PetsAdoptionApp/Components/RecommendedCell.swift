//
//  AnimalCell.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class RecommendedCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: Label = {
        let titleLabel = Label(frame: bounds,
                               textColor: UIColor.primaryColor,
                               font: UIFont.regular,
                               multiline: true)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subtitleLabel: Label = {
        let subtitleLabel = Label(frame: bounds,
                                  textColor: UIColor.primaryColor,
                                  font: UIFont.light,
                                  multiline: true)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var subtitleTwoLabel: Label = {
        let subtitleLabel = Label(frame: bounds,
                                  textColor: UIColor.primaryColor,
                                  font: UIFont.extraLight,
                                  multiline: true)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    var pet: Pet? {
        didSet {
            guard let pet = pet else { return }
            
            containerView.backgroundColor = pet.backgroundColor
            
            titleLabel.text = pet.breed
            
            subtitleLabel.text = "\(pet.ageInMonths) months"
            
            subtitleTwoLabel.text = pet.isMale ? "Male" : "Female"
            
            imageView.image = pet.photo
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
        containerView.layer.cornerRadius = 12
    }
    
    private func commonInit() {
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
        
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        
        insertSubview(titleLabel, aboveSubview: imageView)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            ])
        
        insertSubview(subtitleLabel, aboveSubview: imageView)
        NSLayoutConstraint.activate([
            subtitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            subtitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 48)
            ])
        
        insertSubview(subtitleTwoLabel, aboveSubview: imageView)
        NSLayoutConstraint.activate([
            subtitleTwoLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            subtitleTwoLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            subtitleTwoLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            subtitleTwoLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 48)
            ])
    }
}
