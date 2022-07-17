//
//  ModelData.swift
//  Productivity Inside Test
//
//  Created by Роман on 14.07.2022.
//

struct MainModel {
    var userPlayerData: PlayerData
    var computerPlayerData: PlayerData
    
    static func getMainModel() -> MainModel {
        MainModel(userPlayerData: PlayerData(currentNumber: 0,
                                             numberOfAttempts: 0),
                  computerPlayerData: PlayerData(currentNumber: 0,
                                                 numberOfAttempts: 0,
                                                 answer: Answer(answerIsMore: "No,my number is less than you answered",
                                                                answerIsLess: "No,my number is more than you answered",
                                                                answerIsCorrect: "Yes, you answered correctly")
                                                )
        )
    }
    
    private mutating func addNumberPlayer (_ number: Int, for player: Player) {
        switch player {
        case .computer:
            computerPlayerData.currentNumber = number
        case .user:
            userPlayerData.currentNumber = number
        }
    }
}

struct PlayerData {
    var currentNumber: Int
    var numberOfAttempts: Int
    var answer: Answer?
}

enum Player {
    case computer
    case user
}

struct Answer {
    var answerIsMore: String
    var answerIsLess: String
    var answerIsCorrect: String
}

