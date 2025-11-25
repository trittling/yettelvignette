//
//  SuccessView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct SuccessView: View {
    @State private var showConfetti = false
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            Color.init(hex: Colors.green.rawValue)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(Constans.Texts.successTitle.rawValue)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding(.top, 150)
                .padding(.leading, 16)
                
                HStack {
                    Spacer()
                    
                    Image(Constans.Images.yettelMan.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 281, height: 293)
                        .ignoresSafeArea()
                        .padding(.trailing, -24)
                }
                .padding(.top, 64)
                
                Spacer()
                
                Button(Constans.Texts.next.rawValue, action: {
                    path = NavigationPath()
                })
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
        }
        .onAppear {
            showConfetti = true
        }
        .displayConfetti(isActive: $showConfetti)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SuccessView(path: .constant(NavigationPath()))
}
