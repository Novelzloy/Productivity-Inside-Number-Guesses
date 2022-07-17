//
//  FinishView.swift
//  Productivity Inside Test
//
//  Created by Роман on 12.07.2022.
//

import Foundation
import UIKit

class ResultViewControllers: UIViewController {
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Scores:"
        return label
    }()
    
    private lazy var triesCountUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You`re tries count: 6"
        return label
    }()
    
    private lazy var triesCountComputersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Computers`s tries count: 6"
        return label
    }()
    
    private lazy var winLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You win"
        return label
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("Main menu", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tapMainMenu), for: .touchUpInside)
        return button
    }()
    
    var model: MainModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        updateLabelsCount()
        whoWon()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension ResultViewControllers {
    
    private func updateLabelsCount() {
        triesCountUserLabel.text = "You`re tries count: \(model?.userPlayerData.numberOfAttempts ?? 0)"
        triesCountComputersLabel.text = "Computers`s tries count: \(model?.computerPlayerData.numberOfAttempts ?? 0)"
    }
    
    private func whoWon() {
        let userNumberOfAttempts = model?.userPlayerData.numberOfAttempts ?? 0
        let computerNumberOfAttempts = model?.computerPlayerData.numberOfAttempts ?? 0
        if userNumberOfAttempts > computerNumberOfAttempts {
            winLabel.text = "You lost"
        } else {
            winLabel.text = "You win"
        }
    }
    
    private func configure() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(scoreLabel)
        view.addSubview(triesCountUserLabel)
        view.addSubview(triesCountComputersLabel)
        view.addSubview(menuButton)
        view.addSubview(winLabel)
        
        NSLayoutConstraint.activate([
      
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            triesCountUserLabel.bottomAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 80),
            triesCountUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            triesCountComputersLabel.bottomAnchor.constraint(equalTo: triesCountUserLabel.bottomAnchor, constant: 30),
            triesCountComputersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            winLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winLabel.bottomAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: -60),
        ])
    }
    
    @objc
    func tapMainMenu() {
        let startViewControllers = StartViewControllers()
        navigationController?.pushViewController(startViewControllers, animated: true)
    }
}
