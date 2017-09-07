//
//  ViewController.swift
//  GameOf17
//
//  Created by Lorman Lau on 9/7/17.
//  Copyright © 2017 Lorman Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var cardCounter: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    
    
    
    var sum: Int = 0
    var currentDeck: Deck!
    var currentHand: Hand!
    var leaderboard: [Int] = []
    
    func start(){
        currentDeck = Deck()
        currentDeck.shuffle()
        sum = 0
        button1.setTitle(String(currentDeck.draw().number), for: .normal)
        button2.setTitle(String(currentDeck.draw().number), for: .normal)
        button3.setTitle(String(currentDeck.draw().number), for: .normal)
        sumLabel.text = String(sum)
        leaderboardButton.isHidden = true
        resetButton.isHidden = true
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        updateCounter()
    }
    
    func updateCounter(){
        cardCounter.text = "Current Cards Left is: " +  String(currentDeck.cards.count)
    }
    
    func checkSum(){
        if sum == 17 {
            sumLabel.text = "You Win!"
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            resetButton.isHidden = false
            leaderboardButton.isHidden = false
            leaderboard.append(currentDeck.cards.count)
        } else if sum > 17 {
            sumLabel.text = "You Lose, Try again"
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            resetButton.isHidden = false
            leaderboardButton.isHidden = false
        }
    }
    @IBAction func showLeaderboard(_ sender: UIButton) {
        var text = ""
        leaderboard.sort{ $0 > $1 }
        sumLabel.text = ""
        sumLabel.font = sumLabel.font.withSize(16)
        for i in leaderboard {
            text += "You: \(i) \r\n"
        }
        sumLabel.text = text
    }

    @IBAction func addToSum(_ sender: UIButton) {
        if let buttonNumber = sender.title(for: .normal){
            let n = Int(buttonNumber)
            sum += n!
            sumLabel.text = String(sum)
        }
        sender.setTitle(String(currentDeck.draw().number), for: .normal)
        checkSum()
        updateCounter()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        start()
        sumLabel.font = sumLabel.font.withSize(64)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

