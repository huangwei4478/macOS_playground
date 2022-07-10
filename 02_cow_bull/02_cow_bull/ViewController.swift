//
//  ViewController.swift
//  02_cow_bull
//
//  Created by wei on 2022/7/10.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var guess: NSTextField!
    
    var answers = ""
    var guesses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startNewGame() {
        guess.stringValue = ""
        guesses.removeAll(keepingCapacity: true)
        answers = ""
        
        var numbers = Array(0 ... 9)
        numbers.shuffle()
        
        for _ in 0 ..< 4 {
            answers.append(String(numbers.removeLast()))
        }
        
        tableView.reloadData()
    }
    
    @IBAction func submitGuess(_ sender: Any) {
        // check for 4 unique characters
        let guessString = guess.stringValue
        guard Set(guessString).count == 4,
              guessString.count == 4 else {
            popupAlert(with: "\(guessString) is not valid, only accept 4-digit unique number")
            return
        }
        
        // ensure there are no non-digit characters
        let badCharacters = CharacterSet(charactersIn: "0123456789").inverted
        guard guessString.rangeOfCharacter(from: badCharacters) == nil else {
            popupAlert(with: "\(guessString) is not valid, only 0 - 9 are valid input.")
            return
        }
        
        // add the guess to the array and table view
        guesses.insert(guessString, at: 0)
        tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .slideDown)
        
        // did the player win?
        
        let resultString = result(for: guessString)
        if resultString.contains("4b") {
            popupAlert(with: "You won!")
            startNewGame()
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return guesses.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if tableColumn?.title == "Guess" {
            // this is the "Guess" column; show a previous guess
            vw.textField?.stringValue = guesses[row]
        } else {
            // this is the "Result" column; call our new methods
            vw.textField?.stringValue = result(for: guesses[row])
        }
        
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
    func result(for guess: String) -> String {
        var bulls = 0
        var cows = 0
        
        let guessLetters = Array(guess)
        let answerLetters = Array(answers)
        
        for (index, letter) in guessLetters.enumerated() {
            if letter == answerLetters[index] {
                bulls += 1
            } else if answerLetters.contains(letter) {
                cows += 1
            }
        }
        
        return "\(bulls)b \(cows)c"
    }
    
    func popupAlert(with text: String) {
        let alert = NSAlert()
        alert.messageText = text
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}

