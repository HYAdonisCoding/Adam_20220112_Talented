//
//  EmojiMemoryGame.swift
//  Adam_20220212_Memorize
//
//  Created by Adam on 2022/2/17.
// ---- ViewModel ----

import Foundation

//func makeCardContent(index: Int) -> String {
//    "😝"
//}


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    static let emojis = ["🚲", "🚂", "🚁", "🚜","🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵",  "🚗", "🚚", "🚇", "🛻", "🚅",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { index in
            emojis[index]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: Card) {
//        objectWillChange.send()
        model.choose(card)
        
    }
    
}
