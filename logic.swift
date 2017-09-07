//
//  logic.swift
//  GameOf17
//
//  Created by Lorman Lau on 9/7/17.
//  Copyright © 2017 Lorman Lau. All rights reserved.
//

import UIKit

struct Card {
    var number: Int
}

class Deck {
    var cards = [Card]()
    init() {
        for _ in 0...5 {
            let oneCard = Card(number: 1)
            cards.append(oneCard)
            let twoCard = Card(number: 2)
            cards.append(twoCard)
            let threeCard = Card(number: 3)
            cards.append(threeCard)
        }
    }
    
    func shuffle() {
        for _ in 0...99 {
            let one = Int(arc4random_uniform(UInt32(cards.count)))
            let two = Int(arc4random_uniform(UInt32(cards.count)))
            if one != two {
                swap(&cards[one], &cards[two])
            }
        }
    }
    func draw() -> Card{
        return cards.remove(at: 0)
    }
}

class Hand {
    var cards = [Card]()
    func startHand(deck: Deck){
        for _ in 0...4 {
            cards.append(deck.draw())
        }
    }
}
