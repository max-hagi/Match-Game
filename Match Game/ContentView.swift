//
//  ContentView.swift
//  Match Game
//
//  Created by Maxime Savehilaghi on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    
    var count = 1
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
            
            
            for i in 1..<count {
                PanelView()
            }
            
        }
        .padding()
    }
}




struct PanelView: View{
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0).foregroundColor(.cyan)
            Text("Test").foregroundColor(.white)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
