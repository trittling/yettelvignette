//
//  AmountView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct AmountView: View {
    private var price: Int = 0
    
    
    init(price: Int) {
        self.price = price
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constans.Texts.amountToBePaid.rawValue)
                    .font(.system(size: 12, weight: .bold))
                    .padding(.top, 24)
                    .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                
                Text(price.formatToHuf())
                    .font(.system(size: 40, weight: .bold))
                    .padding(.bottom, 8)
                    .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
            }
            
            Spacer()
        }
        .padding(.leading, 16)
    }
}

#Preview {
    AmountView(price: 100)
}
