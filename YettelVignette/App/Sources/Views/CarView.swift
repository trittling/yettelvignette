//
//  CarView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct CarView: View {
    let plateNumber: String
    let name: String

    init(plateNumber: String, name: String) {
        self.plateNumber = plateNumber
        self.name = name
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(Constans.Images.car.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .padding(.leading, 24)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(plateNumber)
                    .font(.headline)
                    .padding(.top, 16)
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.bottom, 16)
            }
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
        )
    }
}

#Preview {
    CarView(plateNumber: "ABC 124", name: "Michael Scott")
}
