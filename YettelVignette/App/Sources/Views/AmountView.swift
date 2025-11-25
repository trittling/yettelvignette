//
//  AmountView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct AmountView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constans.Texts.amountToBePaid.rawValue)
                    .font(.system(size: 12, weight: .bold))
                    .padding(.top, 24)
                    .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                
                Text("21 800 Ft")
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
    AmountView()
}
