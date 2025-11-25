//
//  AnnualSelectorView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI
import SVG2Path

struct AnnualSelectorView: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text(Constans.Texts.annualTitle.rawValue)
                        .bold()
                        .padding(.top, 24)
                        .padding(.leading, 16)
                        .padding(.bottom, 8)
                        .titleStlye()
                    
                    Spacer()
                }
                
                Image("Map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                ScrollView {
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                    CheckboxView(title: "Bács-Kiskun", price: "5 450 Ft", onSelect: {
                        print("selected")
                    })
                }
                
                Divider()
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                
                AmountView()
                
                Button(Constans.Texts.next.rawValue, action: {
                    navigate = true
                })
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                
                Spacer()
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 16)
            .navigationTitle(Constans.Texts.title.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.init(hex: Colors.green.rawValue), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationDestination(isPresented: $navigate) {
                SummaryView()
            }
        }
    }
}

#Preview {
    AnnualSelectorView()
}
