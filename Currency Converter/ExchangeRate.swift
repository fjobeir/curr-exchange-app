//
//  ExchangeRate.swift
//  Currency Converter
//
//  Created by Feras Jobeir on 28.06.2023.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var rightImage: String
    @State var text: String
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", text: "1 Gold Penny = 4 Silver Pieces")
            .previewLayout(.sizeThatFits)
    }
}
