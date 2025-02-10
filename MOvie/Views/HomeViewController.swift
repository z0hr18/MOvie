//
//  HomeViewController.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 04.02.25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you want to watch?"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 36/255, green: 42/255, blue: 50/255, alpha: 1.0)
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
    }
    
}

