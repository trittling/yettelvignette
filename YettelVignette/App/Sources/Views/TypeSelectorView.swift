//
//  TypeSelectorView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct TypeSelectorView: View {
    @Binding private var selectedVignette: HighwayVignette?
    
    let onSelect: () -> Void
    let higwayVignettes: [HighwayVignette]
    
    init(selectedVignette: Binding<HighwayVignette?>, higwayVignettes: [HighwayVignette], onSelect: @escaping () -> Void) {
        self.onSelect = onSelect
        self.higwayVignettes = higwayVignettes
        self._selectedVignette = selectedVignette
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(Constans.Texts.typeSelectorTitle.rawValue)
                    .bold()
                    .padding(.top, 24)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                    .titleStlye()
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(higwayVignettes, id: \.self) { item in
                    if let typeString = item.vignetteType.first,
                       let type = Constans.VignetteType(rawValue: typeString) {
                        TypeView(
                            title: type.displayName,
                            price: item.sum.formatToHuf(),
                            isSelected: selectedVignette == item
                        ) {
                            selectedVignette = item
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Button(Constans.Texts.buy.rawValue, action: {
                onSelect()
            })
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
    }
}
