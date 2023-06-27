//
//  EmojiMatchGame.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-24.
//

import SwiftUI

class EmojiMatchGame: ObservableObject {
    
    static let emojiThemes: Dictionary<String, Array<String>> = [
         "vehicles": ["🚗", "🚑", "🚓", "🚂", "🚀", "⛴️", "🚁", "🚠", "🚜", "🚒"],
         "animals": ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🦁", "🐮", "🐷"],
         "fruit" : ["🍎", "🍋", "🍌", "🍉", "🍓", "🫐", "🍒", "🍑", "🍍", "🥥"]
     ]

    // Returns the list of possible themes
    var getKeys = emojiThemes.keys.sorted()
    
    static func createMatchGame() -> MatchGame<String> {
        MatchGame(numberCardPairs: 5) {index in emojiThemes[emojiThemes.keys.sorted()[0]]![index]}

    }


    
    @Published private var model: MatchGame<String> = createMatchGame()
    
    // Shows possible card options
    var cards: Array<MatchGame<String>.Card> {
        return model.cards
    }

    
    // MARK: - Intents(s)
    
    func select(_ card: MatchGame<String>.Card){
        model.selectCard(card)
    }
}

