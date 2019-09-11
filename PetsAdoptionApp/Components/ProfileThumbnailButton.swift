//
//  ProfileThumbnailButton.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class ProfileThumbnailButton: UIView {
    
    struct ProfileThumbnail {
        let name: String
        let picture: UIImage?
        
        static let testObject = ProfileThumbnail(name: "Emma", picture: UIImage.profilePicture)
    }
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: bounds)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .white
        return containerView
    }()
    
    private lazy var label: Label = {
        let label = Label(frame: bounds,
                          textColor: UIColor.primaryColor,
                          textAlignment: .center,
                          font: UIFont.light,
                          multiline: false)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var circularImageView: CircularImageView = {
        let circularImageView = CircularImageView(frame: bounds)
        circularImageView.translatesAutoresizingMaskIntoConstraints = false
        return circularImageView
    }()
    
    var profileThumbnail: ProfileThumbnail? {
        didSet {
            label.text = profileThumbnail?.name
            circularImageView.image = profileThumbnail?.picture
        }
    }
    
    var onTap: (() -> Void)?
    
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
        self.onTap?()
    }
    
    private func commonInit() {
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 120),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor)
            ])
        
        insertSubview(circularImageView, aboveSubview: containerView)
        NSLayoutConstraint.activate([
            circularImageView.widthAnchor.constraint(equalToConstant: 40),
            circularImageView.heightAnchor.constraint(equalToConstant: 40),
            circularImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            circularImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
            ])
        
        containerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8),
            label.rightAnchor.constraint(equalTo: circularImageView.leftAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
            ])
        
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
        containerView.layer.cornerRadius = containerView.frame.height / 2
    }
}
