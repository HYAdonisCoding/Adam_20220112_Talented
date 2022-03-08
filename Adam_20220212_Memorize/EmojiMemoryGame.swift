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


class EmojiMemoryGame {
    static let emojis = ["🚲", "🚂", "🚁", "🚜","🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵",  "🚗", "🚚", "🚇", "🛻", "🚅",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { index in
            emojis[index]
        }
    }

    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
