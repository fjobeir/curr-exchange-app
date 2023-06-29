//
//  ExchangeInfo.swift
//  Currency Converter
//
//  Created by Feras Jobeir on 28.06.2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("parchment").resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                Text("Exchange Rate")
                    .font(.largeTitle)
                Text("Lorem ipsum dolor sit amit")
                    .font(.title2)
                    .padding()
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", text: "1 Gold penny = 4 Silver Pieces")
                ExchangeRate(leftImage: "silverpiece", rightImage: "silverpenny", text: "1 Silver Piece = 4 Silver Penny")
                ExchangeRate(leftImage: "silverpenny", rightImage: "copperpenny", text: "1 Silver Penny = 100 Copper Penny")
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
            .foregroundColor(.black)
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo().preferredColorScheme(.dark)
    }
}
