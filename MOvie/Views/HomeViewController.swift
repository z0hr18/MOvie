//
//  HomeViewController.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 04.02.25.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you want to watch?"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///search reusable olacaq
    private let searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .darkGray
        view.alpha = 0.7
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textColor = .white
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return AppLayouts.shared.createFeaturedSection()
            case 1:
                return AppLayouts.shared.createCategoriesSection()
            case 2:
                return AppLayouts.shared.createMoviesGridSection()
            default:
                return nil
            }
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 36/255, green: 42/255, blue: 50/255, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        configureUI()
    }
    
    private func configureUI() {
        [titleLabel,
         searchView,
         collectionView].forEach(view.addSubview)
        [searchIcon,
         searchTextField].forEach(searchView.addSubview)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            searchView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            searchView.heightAnchor.constraint(equalToConstant: 40),
            
            searchIcon.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -12),
            searchIcon.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 12),
            searchTextField.trailingAnchor.constraint(equalTo: searchIcon.leadingAnchor, constant: -8),
            searchTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 21),
            
            collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3 // Section-ların sayı
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8 // Hər section üçün 5 element
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Hər section üçün fərqli rəngdə
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .systemRed  // Featured bölməsi
        case 1:
            cell.backgroundColor = .systemGreen  // Categories bölməsi
        case 2:
            cell.backgroundColor = .systemBlue  // Movies Grid bölməsi
        default:
            cell.backgroundColor = .gray
        }
        
        cell.layer.cornerRadius = 10
        return cell
    }
}



