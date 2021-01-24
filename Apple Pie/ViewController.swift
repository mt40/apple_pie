//
//  ViewController.swift
//  Apple Pie
//
//  Created by Thai Minh on 21/01/2021.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var treeImageView: UIImageView!
  @IBOutlet var correctWordLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var letterButtons: [UIButton]!
  
  var listOfWords = ["tea", "milk", "chicken", "noodle"]
  let incorrectMovesAllowed = 7
  var totalWins = 0 {
    didSet {
      newRound()
    }
  }
  var totalLosses = 0 {
    didSet {
      newRound()
    }
  }
  var currentGame: Game!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    newRound()
  }
  
  @IBAction func letterButtonPressed(_ sender: UIButton) {
    sender.isEnabled = false
    let letterString = sender.title(for: .normal)!
    let letter = Character(letterString.lowercased())
    currentGame.playerGuessed(letter: letter)
    updateGameState()
  }
  
  func newRound() {
    if !listOfWords.isEmpty {
      let newWord = listOfWords.removeFirst()
      currentGame = Game(
        word: newWord,
        incorrectMovesRemaining: incorrectMovesAllowed,
        guessedLetters: []
      )
      print("current game: \(String(describing: currentGame))")
      
      enableButtons(true)
      updateUI()
    } else {
      enableButtons(false)
    }
  }
  
  func enableButtons(_ enable: Bool) {
    for button in letterButtons {
      button.isEnabled = enable
    }
  }
  
  func updateUI() {
    var letters = [String]()
    for letter in currentGame.formattedWord {
      letters.append(String(letter))
    }
    let wordWithSpacing = letters.joined(separator: " ")
    correctWordLabel.text = wordWithSpacing
    
    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
  }
  
  func updateGameState() {
    if currentGame.incorrectMovesRemaining == 0 {
      totalLosses += 1
    }
    else if currentGame.formattedWord == currentGame.word {
      totalWins += 1
    }
    else {
      updateUI()
    }
  }
}

