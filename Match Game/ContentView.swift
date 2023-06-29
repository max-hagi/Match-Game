//
//  ContentView.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game: EmojiMatchGame
    
    var body: some View {
        
        if game.gameStatus {
            VStack {
                Text("⭐️ Match Game ⭐️").font(.largeTitle)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                        ForEach(game.cards) { card in
                            PanelView(card)
                                .foregroundColor(.mint)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {game.select(card)}
                        }
                    }
                }
                
                Spacer()
                
                // TODO
                //            HStack {
                //                Spacer()
                //
                //                var currentTheme = "Vehicles"
                //
                //                Picker("Select a theme", selection: currentTheme){
                //
                //                    for theme in viewModel.themeKeys {
                //                        Text(theme.capitalized)
                //                    }
                //                }.pickerStyle(.automatic)
                //
                //                Spacer()
                //            }
            }
            
        }
        else {
            GameEndedView()
        }
    }
    
    struct PanelView: View {
        var card: MatchGame<String>.Card
        
        init(_ card: MatchGame<String>.Card) {
            self.card = card
        }
        
        let cardShape = RoundedRectangle(cornerRadius: 20.0)
        
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View {
            ZStack {
                if card.isFaceDown && !card.isMatched {
                    cardShape.fill()
                    Text("")
                }
                
                else {
                    // If card is matched
                    if card.isMatched {
                       cardShape.fill().foregroundColor(.green)
                   }
                    else {
                        if colorScheme == .dark {
                            cardShape.fill().foregroundColor(.white)
                            cardShape.stroke(lineWidth: 3).foregroundColor(.mint)
                        }
                        else {
                            cardShape.fill().foregroundColor(.mint).opacity(0.75)
                            cardShape.stroke(lineWidth: 3).foregroundColor(.mint)
                        }
                    }
                    Text(card.content).font(.largeTitle)
                }
                
            }.padding()
        }
    }
    
    
    struct GameEndedView: View {
        var body: some View {
            Text("You matched all the cards!").font(.largeTitle).padding(.horizontal)
            
//            Button(action: viewModel.gameStatus.toggle, label: Text("Play Again?"))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            
            let game = EmojiMatchGame()
            
            ContentView(game: game).preferredColorScheme(.light)
            ContentView(game: game).preferredColorScheme(.dark)
        }
    }
}


