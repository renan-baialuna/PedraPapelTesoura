//
//  ViewController.swift
//  PedraPapelTesoura
//
//  Created by Renan Baialuna on 23/12/20.
//

import UIKit

enum gameMoves: Int, CaseIterable {
    case rock = 0
    case paper
    case scisors
}

enum gameImageStatus: String {
    case PaperCoversRock
    case RockCrushesScissors
    case ScissorsCutPaper
    case itsATie
}

enum gameResults: String {
    case victory
    case tie
    case defeat
}

struct gameData {
    let result: gameResults!
    let imageName: gameImageStatus!
}

class MakePlayViewController: UIViewController {
    
    var gameResult: gameData?
    var playerMove: gameMoves?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func goesPaper() {
        let playerMove = gameMoves(rawValue: 1)
        let aiMove = generateAiMove()
        let gameResult = self.determinateVictor(playerMove: playerMove!, aiMove: aiMove)
        
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.result = gameResult
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func goesRock() {
        self.playerMove = .rock
        performSegue(withIdentifier: "fromScisors", sender: self)
    }
    
    @IBAction func makeMove(_ sender: UIButton) {
        self.playerMove = gameMoves(rawValue: sender.tag)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aiMove = generateAiMove()
        self.gameResult = self.determinateVictor(playerMove: self.playerMove!, aiMove: aiMove)
        
        let controller = segue.destination as! ResultsViewController
        controller.result = self.gameResult
    }
    
    func generateAiMove() -> gameMoves {
        let randomValue = Int(arc4random()) % (gameMoves.allCases.count)
        return gameMoves(rawValue: Int(randomValue))!
    }
    
    func determinateVictor(playerMove: gameMoves, aiMove: gameMoves) -> gameData {
        
        if playerMove == aiMove {
            return gameData(result: .tie, imageName: .itsATie)
        } else if (playerMove == .paper && aiMove == .rock) ||
                  (playerMove == .rock && aiMove == .scisors) ||
                  (playerMove == .scisors && aiMove == .paper)
        {
            switch aiMove {
            case .rock:
                return gameData(result: .victory, imageName: .PaperCoversRock)
            case .paper:
                return gameData(result: .victory, imageName: .ScissorsCutPaper)
            case .scisors:
                return gameData(result: .victory, imageName: .RockCrushesScissors)
            }
        } else {
            switch aiMove {
            case .rock:
                return gameData(result: .defeat, imageName: .RockCrushesScissors)
            case .paper:
                return gameData(result: .defeat, imageName: .PaperCoversRock)
            case .scisors:
                return gameData(result: .defeat, imageName: .ScissorsCutPaper)
            }
        }
    }
    
}

