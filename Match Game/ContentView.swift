//
//  ContentView.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMatchGame
    
    var body: some View {
        VStack {
            
            Text("⭐️ Match Game ⭐️").font(.largeTitle)
            
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.cards) {card in
                        PanelView(card: card)
                            .foregroundColor(.mint)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.select(card)
                            }
                    }
                }
            }
                
            Spacer()
            
        
        
            
            
            
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
    
    struct PanelView: View {
        
        var card: MatchGame<String>.Card
        
        let cardShape = RoundedRectangle(cornerRadius: 20.0)
        
        var body: some View {
            ZStack {
                
                if card.isFlipped {
                    cardShape.fill()
                    Text("")
                }
                
                else {
                    cardShape.fill().foregroundColor(.white)
                    cardShape.stroke(lineWidth: 3)
                    Text(card.content).font(.largeTitle)
                }
                
            }.padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            
            let game = EmojiMatchGame()
            
            ContentView(viewModel: game).preferredColorScheme(.light)
            ContentView(viewModel: game).preferredColorScheme(.dark)
        }
    }
}


