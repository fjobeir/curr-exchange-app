//
//  CurrencyIcon.swift
//  Currency Converter
//
//  Created by Feras Jobeir on 28.06.2023.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var image: String
    @State var name: String
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                Text(name)
                    .padding(3)
                    .font(.caption)
                    .background(.brown.opacity(0.75))
                .foregroundColor(.white)
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(image: "copperpenny", name: "Copper Penny")
            .previewLayout(.sizeThatFits)
    }
}
