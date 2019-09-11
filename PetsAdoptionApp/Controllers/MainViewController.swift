//
//  MainViewController.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/6/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var menuButton: UIButton = {
        let menuButton = UIButton()
        menuButton.setImage(UIImage.menu, for: .normal)
        menuButton.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        return menuButton
    }()
    
    lazy var profileThumbnailButton: ProfileThumbnailButton = {
        let profileThumbnailButton = ProfileThumbnailButton()
        return profileThumbnailButton
    }()
    
    private lazy var scrollView: ScrollView = {
        let scrollView = ScrollView(frame: view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: view.bounds)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    lazy var headerView: HeaderView = {
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private lazy var titleLabel: Label = {
        let titleLabel = Label(frame: view.bounds,
                               textColor: UIColor.primaryColor,
                               font: UIFont.bold,
                               multiline: true)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var searchBar: SearchBar = {
        let searchBar = SearchBar(frame: view.bounds)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var sectionHeader: SectionHeaderView = {
        let sectionHeader = SectionHeaderView(frame: view.bounds)
        sectionHeader.translatesAutoresizingMaskIntoConstraints = false
        return sectionHeader
    }()
    
    private lazy var collectionView: CollectionView = {
        let collectionView = CollectionView(frame: view.bounds, controller: self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: "RecommendedCell")
        return collectionView
    }()
    
    private lazy var petTypeSelectorView: TagSelectorView = {
        let petTypeSelectorView = TagSelectorView(frame: view.bounds)
        petTypeSelectorView.translatesAutoresizingMaskIntoConstraints = false
        return petTypeSelectorView
    }()
    
    private lazy var pets: [Pet] = {
        var pets = [Pet]()
        for index in 0...10 {
            if let newPet: Pet = (index % 2 == 0) ? Pet.testObjects.first : Pet.testObjects.last {
                pets.append(newPet)
            }
        }
        return pets
    }()
    
    private var petTypes: [Tag] = Tag.testObjects
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
        configureProfileThumbnail()
        
        configureHeaderView()
    
        configureTitleLabel()
        
        configureSearchBar()
        
        configureSectionHeader()
        
        configurePetTypeSelector()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.searchBar.endEditing(true)
    }
    
    private func addSubviews() {
        NSLayoutConstraint.activate([
            menuButton.widthAnchor.constraint(equalToConstant: 40),
            menuButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: menuButton), animated: true)

        NSLayoutConstraint.activate([
            profileThumbnailButton.widthAnchor.constraint(equalToConstant: 120),
            profileThumbnailButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        navigationItem.setRightBarButton(UIBarButtonItem(customView: profileThumbnailButton), animated: true)
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])

        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])

        containerView.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            headerView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: headerView.padding),
            headerView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -headerView.padding),
            headerView.heightAnchor.constraint(equalToConstant: 200)
            ])

        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: titleLabel.padding),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -titleLabel.padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
            ])

        containerView.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            searchBar.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: searchBar.padding),
            searchBar.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -searchBar.padding),
            searchBar.heightAnchor.constraint(equalToConstant: 55)
            ])
        
        containerView.addSubview(sectionHeader)
        NSLayoutConstraint.activate([
            sectionHeader.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 40),
            sectionHeader.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: searchBar.padding),
            sectionHeader.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -searchBar.padding),
            sectionHeader.heightAnchor.constraint(equalToConstant: 24)
            ])

        containerView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: sectionHeader.bottomAnchor, constant: 12),
            collectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            collectionView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3.35),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            ])
        
        view.addSubview(petTypeSelectorView)
        NSLayoutConstraint.activate([
            petTypeSelectorView.leftAnchor.constraint(equalTo: view.leftAnchor),
            petTypeSelectorView.rightAnchor.constraint(equalTo: view.rightAnchor),
            petTypeSelectorView.heightAnchor.constraint(equalToConstant: 70),
            petTypeSelectorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    private func configureProfileThumbnail() {
        profileThumbnailButton.profileThumbnail = ProfileThumbnailButton
            .ProfileThumbnail
            .testObject
        
        profileThumbnailButton.onTap = {
            // TODO: Navigate to profile
        }
    }
    
    private func configureHeaderView() {
        headerView.header = HeaderView.Header.testObject
        
        headerView.onTap = {
            // TODO: Navigate to header details
        }
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Search for a Pet"
    }
    
    private func configureSearchBar() {
        searchBar.onEditingBegan = { [unowned self] in
            self.scrollView.scrollToView(view: self.titleLabel, animated: true)
        }
        
        searchBar.onTextChanged = { [unowned self] text in
            self.scrollView.scrollToView(view: self.titleLabel, animated: true)
        }
        
        searchBar.onSearchButtonTap = { [unowned self] text in
            self.searchBar.endEditing(true)
        }
    }
    
    private func configureSectionHeader() {
        sectionHeader.section = SectionHeaderView.Section.testObject
        
        sectionHeader.onButtonTapped = { section in
            // TODO: Navigate to selected section
        }
    }
    
    private func configurePetTypeSelector() {
        petTypeSelectorView.setItems(self.petTypes)
        
        petTypeSelectorView.selectItem(at: IndexPath(item: 0, section: 0), animated: true)
        
        petTypeSelectorView.onSelectionChange = { [weak self] indexPath in
            guard let self = self else { return }
            let newPetTypeSelected = self.petTypes[indexPath.row]
            print(newPetTypeSelected)
        }
    }
    
    @objc func openMenu() {
        // TODO: Open side menu
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(pet: pets[indexPath.item]), animated: true)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendedCell
        cell.pet = pets[indexPath.item]
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = (collectionView.frame.width / 1.5)
        return CGSize(width: width, height:height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
