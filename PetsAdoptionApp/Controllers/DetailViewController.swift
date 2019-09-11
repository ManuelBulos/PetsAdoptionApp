//
//  DetailViewController.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/10/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: view.bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var pet: Pet
    
    init(pet: Pet) {
        self.pet = pet
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        self.addSubviews()
        self.configureImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 3)
            ])
    }
    
    private func configureImageView() {
        imageView.image = pet.photo
    }
}
