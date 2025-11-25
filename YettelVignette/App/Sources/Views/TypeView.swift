//
//  TypeView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct TypeView: View {
    let title: String
    let price: String
    let isSelected: Bool
    let onSelect: () -> Void
    
    init(title: String, price: String, isSelected: Bool, onSelect: @escaping () -> Void) {
        self.title = title
        self.price = price
        self.isSelected = isSelected
        self.onSelect = onSelect
    }
    
    var body: some View {
        VStack{
            HStack(spacing: 12) {
                Image(isSelected ?
                      Constans.Images.radioButtonOn.rawValue :
                      Constans.Images.radioButtonOff.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .padding(.leading, 24)
                    .padding(.trailing, 4)
                    .padding(.vertical, 24)
                
                    Text(title)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(price)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .padding(.trailing, 24)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .overlay(
                       RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? Color(hex: Colors.primaryTextColor.rawValue) :
                                Color(hex: Colors.radioButtonOff.rawValue), lineWidth: 2)
                   )
        )
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    TypeView(title: "D1", price: "6400 Ft", isSelected: false, onSelect: {})
}
