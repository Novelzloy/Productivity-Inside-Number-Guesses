//
//  NumberGuessesPlayerView.swift
//  Productivity Inside Test
//
//  Created by Роман on 12.07.2022.
//

import Foundation
import UIKit

class NumberGuessesPlayerStartViewControllers: UIViewController {
    
    private lazy var tryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Try №2"
        return label
    }()
    
    private lazy var yourGuessingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You are guessing"
        return label
    }()
    
    private lazy var textFieldPlayer: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your number"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var buttonGuess: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("Guess", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(numberEntered), for: .touchUpInside)
        return button
    }()
    
    private lazy var yourNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Try to guess my number :)"
        return label
    }()
    
    private var model = MainModel.getMainModel()
    private var randomNumberGenerator = RandomNumberGenerator()
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        hideKeyboardWhenTappedAround()
        randomNumberGenerator.randomNumberGenerator()
        textFieldPlayer.keyboardType = .numberPad
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension NumberGuessesPlayerStartViewControllers {
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func updateYourNumberLabel() {
        guard let enterNumberUser = Int(textFieldPlayer.text ?? " ") else {return}
        yourNumberLabel.text = randomNumberGenerator.numberGuessing(for: enterNumberUser)
    }
    
    private func removeAllData() {
        guard let textFieldStringToInt = Int(textFieldPlayer.text ?? "") else {return}
        if  textFieldStringToInt > 100 || textFieldStringToInt < 1 {
            textFieldPlayer.text?.removeAll()
        }
    }
    
    private func nextToScreen() {
        let stringToInt = Int(textFieldPlayer.text ?? "")
        if randomNumberGenerator.numberToGuess == stringToInt {
            let resultViewControllers = ResultViewControllers()
            resultViewControllers.model = model
            self.navigationController?.pushViewController(resultViewControllers, animated: true)
        }
    }
    
    private func counterFunc() {
        counter += 1
        model.userPlayerData.numberOfAttempts = counter
    }
    
    private func configure() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(tryLabel)
        view.addSubview(yourGuessingLabel)
        view.addSubview(textFieldPlayer)
        view.addSubview(buttonGuess)
        view.addSubview(yourNumberLabel)
        
        NSLayoutConstraint.activate([
      
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            yourGuessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yourGuessingLabel.bottomAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 50),
            
            textFieldPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldPlayer.bottomAnchor.constraint(equalTo: yourGuessingLabel.bottomAnchor, constant: 80),
            
            buttonGuess.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonGuess.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonGuess.bottomAnchor.constraint(equalTo: textFieldPlayer.bottomAnchor, constant: 80),
            
            yourNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yourNumberLabel.bottomAnchor.constraint(equalTo: buttonGuess.bottomAnchor, constant: 80)
            
        ])
    }
    
    @objc
    func numberEntered() {
        updateYourNumberLabel()
        removeAllData()
        nextToScreen()
        counterFunc()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
