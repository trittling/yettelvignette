//
//  SummaryItemView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct SummaryItemView: View {
    let title: String
    let price: String
    
    init(title: String, price: String) {
        self.title = title
        self.price = price
    }
    
    var body: some View {
        VStack{
            HStack() {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                
                Spacer()
                
                Text(price)
                    .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                    .font(.system(size: 14, weight: .light))
            }
        }
        .padding(.top, 16)
    }
}

#Preview {
    SummaryItemView(title: "Baranya", price: "1500 Ft")
}
