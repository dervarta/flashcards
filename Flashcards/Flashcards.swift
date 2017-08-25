//
//  Flashcards.swift
//  Flashcards
//
//  Created by Sarah Dervartanian on 8/24/17.
//  Copyright © 2017 Sarah Dervartanian. All rights reserved.
//

import Foundation

class Flashcard {
    
    var question : String
    var options : [String]
    var correctAnswer : String
    
    init(question: String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

class CardCollection {
    
    //single instance of the card collection
    //to access, use CardCollection.instance
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    //to access current card, type CardCollection.instance.currentCard
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init(){
        
        cards = [ Flashcard(question: "Test Question", options: ["True","False"]),
                  Flashcard(question: "Who am I?", options:["Sarah", "Rebekah", "Deborah", "Joseph"]),
                  Flashcard(question: "Where did I go to school?", options:["USC", "Azusa Pacific", "Chapman"])]
        
        currentIndex = 0;
    }
    
    public func nextQuestion(){
        currentIndex += 1
        if currentIndex >= cards.count {
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        if (currentCard.options[selectedAnswer] == currentCard.correctAnswer){
            return true
        }
        else { return false }

    }
}
