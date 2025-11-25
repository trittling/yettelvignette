//
//  AnnualSelectorView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI
import SVG2Path

struct AnnualSelectorView: View {
    
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

                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .navigationTitle(Constans.Texts.title.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.init(hex: Colors.green.rawValue), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    AnnualSelectorView()
}
