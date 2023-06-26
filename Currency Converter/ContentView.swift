//
//  ContentView.swift
//  Currency Converter
//
//  Created by Feras Jobeir on 27.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    var body: some View {
        ZStack {
            Image("background").resizable().edgesIgnoringSafeArea(.all)
            VStack {
                Image("prancingpony").resizable().scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange").font(.largeTitle)
                    .foregroundColor(.white)
                HStack {
                    VStack {
                        HStack {
                            Image("silverpiece").resizable().scaledToFit()
                                .frame(height: 33)
                            Text("Silver Piece").font(.headline).foregroundColor(.white)
                            
                        }
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(.white)
                            .cornerRadius(7)
                    }
                    
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    VStack {
                        HStack {
                            Text("Gold Piece").font(.headline).foregroundColor(.white)
                            Image("goldpiece").resizable().scaledToFit()
                                .frame(height: 33)
                            
                            
                        }
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(.white)
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
