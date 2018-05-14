//
//  GameVC.swift
//  GameProject
//
//  Created by Yaroslav Halivets on 4/28/18.
//  Copyright © 2018 Yaroslav Halivets. All rights reserved.
//

import Foundation

struct Game {
   private (set) var cards = [Card]()
   private var indexOfOnlyFaceUp : Int?{
        get {
            return cards.indices.filter {
                cards[$0].isFaceUp
            }.oneAndOnly
           
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
   mutating func chooseCard(at index : Int){
        assert(cards.indices.contains(index) , "chooseCard(at : \(index)) - not in the cards")
        if !cards[index].isMathed{
            if let matchIndex = indexOfOnlyFaceUp , matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[index].isMathed = true
                    cards[matchIndex].isMathed = true
            }
                cards[index].isFaceUp = true
                
                
                
            }else {
               
                indexOfOnlyFaceUp = index
        }
    }
    }
    
    init(numberOfPairsCards : Int) {
        assert(numberOfPairsCards > 0  , "init(\(numberOfPairsCards)) - you must have a least one pairs of cards ")
        for _ in 1...numberOfPairsCards{
            let card = Card()
            cards += [card  , card]
        }
       
    }
}
extension Collection {
    var oneAndOnly : Element?{
        return count == 1 ? first : nil
    }
}
