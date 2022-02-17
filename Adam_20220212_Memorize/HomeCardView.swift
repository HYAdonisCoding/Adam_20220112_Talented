//
//  HomeCardView.swift
//  Adam_20220212_Memorize
//
//  Created by Adam on 2022/2/14.
//

import SwiftUI

struct HomeCardView: View {
    var emojis = ["🚲", "🚂", "🚁", "🚜","🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵",  "🚗", "🚚", "🚇", "🛻", "🚅",]
    @State private var emojisCount = 6
    var body: some View {
        
        VStack {
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        
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
            if emojisCount < emojis.count {
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
    var content: String
    @State private var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView()
            .preferredColorScheme(.dark)
        HomeCardView()
            .preferredColorScheme(.light)
    }
}
