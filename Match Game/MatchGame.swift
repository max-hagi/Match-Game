//
//  MatchGameLogic.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-24.
//

import Foundation


struct MatchGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    private(set) var themes: Array<String>
    private(set) var currentTheme: String
    private(set) var gameInProgress: Bool
    
    private var faceUpCardIndex: Int?
    
    init(numberCardPairs: Int, themes: Array<String>, createContent: (Int) -> CardContent) {
        self.cards = Array<Card>()
        
        // Creating the cards
        for i in 0..<numberCardPairs {
            let cardContent = createContent(i)
            cards.append(Card(content: cardContent, id: i*2))
            cards.append(Card(content: cardContent, id: i*2+1))
        }
        
        // Adding the theme options
        self.themes = Array<String>()
        for theme in themes {
            self.themes.append(theme)
        }
        
        // There will always be at least one theme
        self.currentTheme = themes[0]
        
        // Set game as in progress
        self.gameInProgress = true
    }
    

    
    struct Card: Identifiable {
        var isFaceDown: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
    
    // Enables function to modify card
    mutating func selectCard(_ selectedCard: Card) {
        if let selectedCardIndex = cards.firstIndex(where: {$0.id == selectedCard.id}), cards[selectedCardIndex].isFaceDown,
            !cards[selectedCardIndex].isMatched {
            
            if let possibleMatchIndex = faceUpCardIndex {
                
                // Match occurs
                if cards[selectedCardIndex].content == cards[possibleMatchIndex].content {
                    cards[selectedCardIndex].isMatched = true
                    cards[faceUpCardIndex!].isMatched = true
                }
                
                faceUpCardIndex = nil
            }
            
            // If not matched correctly
            else {
                for i in cards.indices {
                    cards[i].isFaceDown = true
                }
                faceUpCardIndex = selectedCardIndex
            }
            cards[selectedCardIndex].isFaceDown.toggle()
        }
        
        // Check if all cards are matched
        if checkGame() {
            gameInProgress = false
        }
        
    }
    
    func checkGame () -> Bool {
        for card in cards {
            if !card.isMatched {
                return false
            }
        }
        return true
    }
    
    
    func changeTheme() {
        
    }
    
}
