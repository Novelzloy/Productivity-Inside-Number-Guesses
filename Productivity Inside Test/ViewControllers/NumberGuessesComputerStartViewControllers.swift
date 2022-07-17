//
//  NumberGuessingComputerView.swift
//  Productivity Inside Test
//
//  Created by Роман on 12.07.2022.
//

import Foundation
import UIKit

class NumberGuessesComputerStartViewControllers: UIViewController {
    
    private let cornerRadius: CGFloat = 10
    
    private lazy var tryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Try №1"
        return label
    }()
    
    private lazy var computerGuessingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Computer is guising"
        return label
    }()
    
    private lazy var yourNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your number is - 80?"
        return label
    }()
    
    private lazy var numberIs: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My number is ..."
        return label
    }()
    
    private lazy var buttonMore: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle(">", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(pressButtonMore), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonLess: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("<", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var buttonEquals: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("=", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension NumberGuessesComputerStartViewControllers {
    
    @objc
    func pressButtonMore() {
        let numberGuessesPlayerStartViewControllers = NumberGuessesPlayerStartViewControllers()
        navigationController?.pushViewController(numberGuessesPlayerStartViewControllers, animated: true)
    }
    
    private func configure() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(tryLabel)
        view.addSubview(computerGuessingLabel)
        view.addSubview(yourNumberLabel)
        view.addSubview(buttonMore)
        view.addSubview(buttonLess)
        view.addSubview(buttonEquals)
        view.addSubview(numberIs)
        
        NSLayoutConstraint.activate([
            
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            computerGuessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            computerGuessingLabel.topAnchor.constraint(equalTo: tryLabel.topAnchor, constant: 50),
            
            yourNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yourNumberLabel.topAnchor.constraint(equalTo: computerGuessingLabel.topAnchor, constant: 80),
            
            numberIs.leadingAnchor.constraint(equalTo: buttonMore.leadingAnchor),
            numberIs.topAnchor.constraint(equalTo: buttonEquals.topAnchor, constant: -30),

            buttonEquals.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonEquals.widthAnchor.constraint(equalToConstant: 50),
            buttonEquals.heightAnchor.constraint(equalToConstant: 50),
            buttonEquals.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonLess.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonLess.widthAnchor.constraint(equalToConstant: 50),
            buttonLess.heightAnchor.constraint(equalToConstant: 50),
            buttonLess.trailingAnchor.constraint(equalTo: buttonEquals.trailingAnchor, constant: 50 + 10),
            
            buttonMore.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonMore.widthAnchor.constraint(equalToConstant: 50),
            buttonMore.heightAnchor.constraint(equalToConstant: 50),
            buttonMore.leadingAnchor.constraint(equalTo: buttonEquals.leadingAnchor, constant: -60)
        ])
    }
}
