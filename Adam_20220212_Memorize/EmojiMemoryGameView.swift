//
//  EmojiMemoryGameView.swift
//  Adam_20220212_Memorize
//
//  Created by Adam on 2022/2/14.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    /// ViewModel
    @ObservedObject var game: EmojiMemoryGame
    
    @State private var emojisCount = 8
    
    var body: some View {
        
        VStack {
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                cardView(for: card)
                
            })
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
            if emojisCount < game.cards.count {
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
    
    @ViewBuilder
    private func cardView(for card: MemoryGame<String>.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card: card)
                }
        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 115-90))
                    .padding(5).opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
            
        }
        
        
    }
    func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards.first!)
        return EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
    }
}
