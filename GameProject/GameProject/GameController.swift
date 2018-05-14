//
//  ViewController.swift
//  GameProject
//
//  Created by Yaroslav Halivets on 4/28/18.
//  Copyright © 2018 Yaroslav Halivets. All rights reserved.
//

import UIKit

class GameController: UIViewController {
   private lazy var game = Game(numberOfPairsCards : numberOfPairsCards)
    var numberOfPairsCards : Int {
            return (cardButons.count+1)/2
    }
    
    var theme : String? {
        didSet {
            emojiArray = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    private var emojiArray = "🎃👻👄👅⚽️🍿🥃🍕🥥"
    @IBOutlet var cardButons: [UIButton]!
    private(set) var flipCount = 0 {
        didSet {
           updateCountLabel()
}
}
     private func updateCountLabel () {
        let attribute : [NSAttributedStringKey:Any] =
            [
                .strokeWidth : 5.0 ,
                .strokeColor : UIColor.blue
                
        ]
        let attributedString = NSAttributedString(string : "Flips : \(flipCount)" , attributes : attribute )
        flipLabel.attributedText = attributedString    }
    
    
    @IBOutlet private weak var flipLabel: UILabel!{
        didSet {
            updateCountLabel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in array")
        }
       
        
    }
    func updateViewFromModel () {
        if cardButons != nil {
        for index in cardButons.indices {
           let button = cardButons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMathed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : UIColor.blue
            }
            
        }
    }
    }
    private var emoji = [Card : String]()
    private func emoji(for card : Card) -> String {
        if emoji[card]  == nil  , emojiArray.count > 0{
            let randomStringIndex = emojiArray.index(emojiArray.startIndex, offsetBy: emojiArray.count.arc4random)
            emoji[card] = String( emojiArray.remove(at: randomStringIndex))
        }
       return emoji[card] ?? "?"
    }
    }
extension Int {
    var arc4random : Int {
        if self > 0
        {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
    


