//
//  MapView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct MapView: View {
    @Binding var selectedCounties: [County]
    
    var body: some View {
        ZStack {
            Image("Map")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ForEach(selectedCounties, id: \.self) { county in
                Image(county.id)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
