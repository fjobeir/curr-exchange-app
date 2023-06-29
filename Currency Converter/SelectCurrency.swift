//
//  SelectCurrency.swift
//  Currency Converter
//
//  Created by Feras Jobeir on 28.06.2023.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                Text("Select start currency")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $leftCurrency)
                
                Text("Select currency to convert to")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $rightCurrency)
                
                
                // CurrencyIcon(image: "copperpenny", name: "Copper Penny")
                // CurrencyIcon(image: "copperpenny", name: "Copper Penny")
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
                    
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPenny), rightCurrency: .constant(.goldPiece))
    }
}
