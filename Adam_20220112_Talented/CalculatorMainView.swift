//
//  CalculatorMainView.swift
//  Adam_20220112_Talented
//
//  Created by Adam on 2022/1/14.
//

import SwiftUI

enum BackColor {
    case black, white, orange
}
func color(for color: BackColor) -> Color {
    switch color {
    case .black:
        return Color.black
    case .white:
        return Color.white
    case .orange:
        return Color.orange
    }
    
}
struct CalculatorMainView: View {
    var body: some View {
        Text("+")
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 88, height: 88)
            .padding()
            .background(Color.orange)
            .cornerRadius(44)
        
    }
}

struct CalculatorMainView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorMainView()
    }
}
