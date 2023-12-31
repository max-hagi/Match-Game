//
//  Match_GameApp.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-15.
//

import SwiftUI

@main
struct Match_GameApp: App {
    let game = EmojiMatchGame()
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
