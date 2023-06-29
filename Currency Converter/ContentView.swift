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
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
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
                            Image(
                                CurrencyImage.allCases[
                                    Currency.allCases.firstIndex(of: leftCurrency)!
                                ].rawValue).resizable().scaledToFit()
                                .frame(height: 33)
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue).font(.headline).foregroundColor(.white)
                            
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(.white)
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp) {
                                _ in
                                rightAmount = leftCurrency.convert(amount: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) {
                                _ in
                                leftAmount = rightCurrency.convert(amount: rightAmount, to: leftCurrency)
                            }
                    }
                    
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    VStack {
                        HStack {
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                            .font(.headline).foregroundColor(.white)
                            Image(CurrencyImage.allCases[
                                Currency.allCases.firstIndex(of: rightCurrency)!
                            ].rawValue).resizable().scaledToFit()
                                .frame(height: 33)
                            
                            
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(.white)
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) {
                                _ in
                                leftAmount = rightCurrency.convert(amount: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) {
                                _ in
                                rightAmount = leftCurrency.convert(amount: leftAmount, to: rightCurrency)
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                        
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
