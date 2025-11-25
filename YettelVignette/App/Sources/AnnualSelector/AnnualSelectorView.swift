//
//  AnnualSelectorView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct AnnualSelectorView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
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
                path.append(Constans.Navigation.summary.rawValue)
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
    }
}

#Preview {
    AnnualSelectorView(path: .constant(NavigationPath()))
}
