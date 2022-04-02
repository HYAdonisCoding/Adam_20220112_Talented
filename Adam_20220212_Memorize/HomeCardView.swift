//
//  HomeCardView.swift
//  Adam_20220212_Memorize
//
//  Created by Adam on 2022/2/14.
//

import SwiftUI

struct HomeCardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @State private var emojisCount = 8
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                        
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var addCard: some View {
        Button(action: {
            if emojisCount < viewModel.cards.count {
                emojisCount += 1
            }
            
        }) {
            VStack {
                Image(systemName: "plus.circle")
                
            }
        }
    }
    var remove: some View {
        Button(action: {
            if emojisCount > 1 {
                emojisCount -= 1
            }
            
        }) {
            VStack {
                Image(systemName: "minus.circle")
            }
        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
            
        }
    }
    
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        HomeCardView(viewModel: game)
            .preferredColorScheme(.dark)
        HomeCardView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
