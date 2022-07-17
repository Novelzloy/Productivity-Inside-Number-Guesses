//
//  StartView.swift
//  Productivity Inside Test
//
//  Created by Роман on 12.07.2022.
//

import Foundation
import UIKit

class StartViewControllers: UIViewController {
    
    private lazy var buttonStart: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("Start new game", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Awesome Game"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension StartViewControllers {
    
   private func configure() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(buttonStart)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            
        ])
    }
    
    @objc
    func didTapButton() {
        let enterNumberStartViewControllers = EnterNumberStartViewControllers()
        navigationController?.pushViewController(enterNumberStartViewControllers, animated: true)
    }
}
