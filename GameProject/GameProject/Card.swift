//
//  Card.swift
//  GameProject
//
//  Created by Yaroslav Halivets on 4/28/18.
//  Copyright © 2018 Yaroslav Halivets. All rights reserved.
//

import Foundation

struct Card : Hashable{
    var hashValue : Int {
        return inditifier
    }
    
    static func == (lhs: Card , rhs : Card) -> Bool {
       return lhs.inditifier == rhs.inditifier
    }
    var isFaceUp = false
    var isMathed = false
    private var inditifier : Int
   private static var identfierFactory = 0
   private static func gatUniqueInditifier() -> Int {
       identfierFactory += 1
        return identfierFactory
    }
    init() {
       self.inditifier = Card.gatUniqueInditifier()    }
}
