//
//  ControllerComputer.swift
//  Productivity Inside Test
//
//  Created by Роман on 14.07.2022.
//

import Foundation

final class RandomNumberGenerator {
    
    private let lowBound = 1
    private let upperBound = 100
    public var numberToGuess: Int?
    private var model = MainModel.getMainModel()
    
    func randomNumberGenerator() {
        numberToGuess = Int.random(in: lowBound...upperBound)
        print(numberToGuess ?? 0)
    }
    
    public func numberGuessing(for enterNumber: Int) -> String {
        var result: String = " "
    
        if enterNumber >= numberToGuess ?? 0 {
            result = model.computerPlayerData.answer?.answerIsMore ?? " "
        }
        
        if enterNumber <= numberToGuess ?? 0 {
            result = model.computerPlayerData.answer?.answerIsLess ?? " "
        }
        
        if enterNumber == numberToGuess {
            result = model.computerPlayerData.answer?.answerIsCorrect ?? " "
        }
        
        if enterNumber > upperBound || enterNumber < lowBound {
            result = "Enter a number in the range 1 to 100"
        }
        
        return result
    }
}
