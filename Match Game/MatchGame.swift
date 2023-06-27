//
//  MatchGameLogic.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-24.
//

import Foundation


struct MatchGame<CardContent> {
    
    private(set) var cards: Array<Card>
//    private(set) var themes: Array<String>
//    private(set) var currentTheme: String
    
    init(numberCardPairs: Int, createContent: (Int) -> CardContent) {
        self.cards = Array<Card>()
        
        for i in 0..<numberCardPairs {
            let cardContent = createContent(i)
            cards.append(Card(content: cardContent, id: i*2))
            cards.append(Card(content: cardContent, id: i*2+1))
        }
    }
    
//    init (themeOptions: Array<String>){
//        self.themes = Array<String>()
//
//        for theme in themeOptions {
//            self.themes.append(theme)
//        }
//
//        currentTheme = themes[0]
//    }
    
    struct Card: Identifiable {
        var isFlipped: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        var id: Int
    }
    
    // Enables function to modify card
    mutating func selectCard(_ chosenCard: Card) {
        let chosenCardIndex = index(of: chosenCard)
        cards[chosenCardIndex].isFlipped.toggle()
    }
    
    func index(of card: Card) -> Int{
        for index in 0 ..< cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return -1
    }
    
}
