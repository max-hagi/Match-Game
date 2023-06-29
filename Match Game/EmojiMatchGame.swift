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
    
    static func createMatchGame() -> MatchGame<String> {
        MatchGame(numberCardPairs: 5, themes: emojiThemes.keys.sorted()) {index in emojiThemes[emojiThemes.keys.sorted()[0]]![index]}

    }


    
    @Published private var model: MatchGame<String> = createMatchGame()
    
    
    // Shows possible card options
    var cards: Array<MatchGame<String>.Card> {
        return model.cards
    }
    
    var gameStatus: Bool {
        return model.gameInProgress
    }

    
    // MARK: - Intents(s)
    
    func select(_ card: MatchGame<String>.Card){
        model.selectCard(card)
    }
}

