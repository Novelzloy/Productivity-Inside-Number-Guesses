//
//  EnterNumberView.swift
//  Productivity Inside Test
//
//  Created by Роман on 12.07.2022.
//

import Foundation
import UIKit

class EnterNumberStartViewControllers: UIViewController {
    
    private lazy var enterNumber: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("Enter the number", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(numberEntered), for: .touchUpInside)
        return button
    }()
    
    private lazy var textFieldGuess: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Guess the number"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var constStartButtonY: CGFloat = 0
    
    private var model = MainModel.getMainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        registerForKeyboardNotification()
        hideKeyboardWhenTappedAround()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        constStartButtonY = enterNumber.frame.origin.y
        textFieldGuess.keyboardType = .numberPad
    }
    
    deinit {
        removeForKeyboardNotification()
    }
}

extension EnterNumberStartViewControllers {
    
    func textFieldGuessToModel() {
        let textFieldGuess = Int(textFieldGuess.text ?? "") ?? 0
        model.userPlayerData.currentNumber = textFieldGuess
        print(textFieldGuess)
    }
    
    private func updateModel() {
        model.userPlayerData.currentNumber = Int(textFieldGuess.text ?? " ") ?? 0
    }
    
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func numberEntered() {
        textFieldGuess.resignFirstResponder()
        updateModel()
        textFieldGuessToModel()
        let numberGuessesComputerStartViewControllers = NumberGuessesComputerStartViewControllers()
        navigationController?.pushViewController(numberGuessesComputerStartViewControllers, animated: true)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.enterNumber.frame.origin.y -= keyboardSize.height
        }
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {
        self.enterNumber.frame.origin.y = constStartButtonY
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func configure() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(enterNumber)
        view.addSubview(textFieldGuess)
        NSLayoutConstraint.activate([
            
            enterNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            enterNumber.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            textFieldGuess.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldGuess.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldGuess.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
}
