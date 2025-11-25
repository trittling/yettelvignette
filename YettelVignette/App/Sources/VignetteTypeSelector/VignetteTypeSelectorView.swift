//
//  ContentView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct VignetteTypeSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.init(hex: Colors.backgroundColor.rawValue)
                    .ignoresSafeArea() // Makes sure the color fills the entire screen, including safe areas

                VStack {
                    CarView(plateNumber: "ABC 124", name: "Michael Scott")
                    
                    TypeSelectorView()
                    
                    AnnualView()
                        .padding(.top, 16)
                        .onTapGesture {
                            navigate = true
                        }
                    
                    Spacer()
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .navigationTitle(Constans.Texts.title.rawValue)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.init(hex: Colors.green.rawValue), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $navigate) {
                AnnualSelectorView()
            }
        }
    }
}



#Preview {
    VignetteTypeSelectorView()
}
