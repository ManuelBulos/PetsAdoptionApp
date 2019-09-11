//
//  SearchBar.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/7/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class SearchBar: UITextField {
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 24))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = self.icon
        return iconImageView
    }()
    
    let icon: UIImage? = UIImage.search
    
    let prompt: String = "Search"
    
    var onTextChanged: ((String) -> Void)?
    
    var onSearchButtonTap: ((String?) -> Void)?
    
    var onEditingBegan: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.attributedPlaceholder = NSAttributedString(string: self.prompt,
                                                        attributes: [NSAttributedString.Key.foregroundColor : UIColor.accent,
                                                                     NSAttributedString.Key.font : UIFont.light!])
        self.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        self.clearButtonMode = UITextField.ViewMode.whileEditing
        self.tintColor = UIColor.primaryColor
        self.leftView = self.iconImageView
        self.textColor = UIColor.accent
        self.leftViewMode = .always
        self.borderStyle = .none
        self.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
    }
    
    @objc private func editingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        self.onTextChanged?(text)
    }
    
    
}

extension SearchBar: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.onSearchButtonTap?(textField.text)
        self.endEditing(true)
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.onEditingBegan?()
        return true
    }
}
