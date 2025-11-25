//
//  AnnualView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct AnnualView: View {
    var body: some View {
        HStack {
            Text(Constans.Texts.annualTitle.rawValue)
                .bold()
                .padding(.top, 24)
                .padding(.leading, 16)
                .padding(.bottom, 24)
                .titleStlye()
            
            Spacer()
            
            Image(Constans.Images.arrow.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8, height: 14)
                .padding(.trailing, 8)
        }
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
    }
}

#Preview {
    AnnualView()
}
