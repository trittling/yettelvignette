//
//  CheckboxView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct CheckboxView: View {
    let title: String
    let price: String
    let onSelect: () -> Void
    
    @State private var isSelected: Bool = false
    
    init(title: String, price: String, onSelect: @escaping () -> Void) {
        self.title = title
        self.price = price
        self.onSelect = onSelect
    }
    
    var body: some View {
        VStack{
            HStack(spacing: 12) {
                Image(isSelected ?
                      Constans.Images.checkboxOn.rawValue :
                        Constans.Images.checkboxOff.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .padding(.leading, 16)
                .padding(.trailing, 4)
                .padding(.vertical, 4)
                
                Text(title)
                    .font(.system(size: 16, weight: .light))
                    
                    .foregroundColor(isSelected ?
                                     Color(hex: Colors.checkboxOn.rawValue) :
                                     Color(hex: Colors.primaryTextColor.rawValue)
                    )
                
                Spacer()
                
                Text(price)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                    .padding(.trailing, 24)
            }
        }
        .onTapGesture {
            isSelected.toggle()
            onSelect()
        }
    }
}

#Preview {
    CheckboxView(title: "Bács-Kiskun", price: "5400 Ft", onSelect: {})
}
