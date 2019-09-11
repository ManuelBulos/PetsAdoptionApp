//
//  SectionHeaderView.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    struct Section {
        let name: String
        let items: [String]
        
        static let testObject = Section(name: "Recommended", items: [""])
    }
    
    private lazy var label: Label = {
        let label = Label(frame: bounds,
                          textColor: UIColor.primaryColor,
                          font: UIFont.semiBold,
                          multiline: false)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textButton: TextButton = {
        let textButton = TextButton(frame: bounds)
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.addTarget(self, action: #selector(textButtonTapped(_:)), for: .touchUpInside)
        textButton.titleLabel?.textAlignment = .right
        textButton.setTitle("See all", for: .normal)
        return textButton
    }()
    
    var section: Section? {
        didSet {
            label.text = section?.name
        }
    }
    
    var onButtonTapped: ((Section) -> Void)?
    
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
    
    private func addSubviews() {
        addSubview(textButton)
        NSLayoutConstraint.activate([
            textButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),
            textButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            textButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            label.trailingAnchor.constraint(equalTo: textButton.leadingAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    @objc private func textButtonTapped(_ sender: UIButton) {
        guard let section = section else { return }
        self.onButtonTapped?(section)
    }
}
