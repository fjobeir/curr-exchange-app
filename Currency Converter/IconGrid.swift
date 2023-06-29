//
//  IconGrid.swift
//  Currency Converter
//
//  Created by Feras Jobeir on 29.06.2023.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<5) { i in
                if Currency.allCases[i] == currency {
                    CurrencyIcon(image: CurrencyImage.allCases[i].rawValue, name: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                        )
                        .shadow( color: .black, radius: 9)
                } else {
                    CurrencyIcon(image: CurrencyImage.allCases[i].rawValue, name: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0)
                            .opacity(0.5)
                        )
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.silverPiece))
    }
}
