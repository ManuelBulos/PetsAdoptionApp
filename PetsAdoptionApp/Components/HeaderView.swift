//
//  HeaderView.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    struct Header {
        let image: UIImage?
        let title: String
        let subtitle: String
        let buttonText: String
        
        static let testObject = Header(image: UIImage.header,
                                       title: "Join Today\nAnd Save Lives",
                                       subtitle: "Shelter pets need your monthly gift",
                                       buttonText: "Donate")
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: Label = {
        let titleLabel = Label(frame: bounds,
                               textColor: UIColor.primaryColor,
                               font: UIFont.medium,
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
    
    private lazy var textButton: RoundedButton = {
        let textButton = RoundedButton(frame: bounds)
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.isUserInteractionEnabled = false
        return textButton
    }()
    
     var onTap: (() -> Void)?
    
    var header: Header? {
        didSet {
            imageView.image = header?.image
            titleLabel.text = header?.title
            subtitleLabel.text = header?.subtitle
            textButton.setTitle(header?.buttonText, for: .normal)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.onTap?()
    }
    
    private func commonInit() {
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        insertSubview(titleLabel, aboveSubview: imageView)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            ])
        
        insertSubview(subtitleLabel, aboveSubview: imageView)
        NSLayoutConstraint.activate([
            subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            subtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 48)
            ])
        
        insertSubview(textButton, aboveSubview: imageView)
        NSLayoutConstraint.activate([
            textButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            textButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            textButton.widthAnchor.constraint(equalToConstant: 145),
            textButton.heightAnchor.constraint(equalToConstant: 45),
            ])
        
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        addShadow()
        imageView.layer.cornerRadius = 12
    }
}
