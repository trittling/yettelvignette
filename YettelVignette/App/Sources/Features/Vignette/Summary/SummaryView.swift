//
//  SummaryView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct SummaryView: View {
    @Binding var path: NavigationPath

    var body: some View {
            ZStack {
                Color.init(hex: Colors.backgroundColor.rawValue)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text(Constans.Texts.summaryTitle.rawValue)
                            .bold()
                            .padding(.top, 24)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                            .titleStlye()
                        
                        Spacer()
                    }
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    HStack {
                        Text(Constans.Texts.plateNumber.rawValue)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                        
                        Spacer()
                        
                        Text("ABC 123")
                            .padding(.top, 16)
                            .padding(.trailing, 16)

                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                    }
                    
                    HStack {
                        Text(Constans.Texts.vignetteType.rawValue)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                        
                        Spacer()
                        
                        Text("Éves")
                            .padding(.top, 16)
                            .padding(.trailing, 16)
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                    }
                    .padding(.bottom, 8)
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    VStack {
                        SummaryItemView(title: "Baranya", price: "5720 Ft")
                        SummaryItemView(title: "Győr-Moson Sopron", price: "5720 Ft")
                        SummaryItemView(title: "Pest", price: "5720 Ft")
                        
                        HStack() {
                            Text(Constans.Texts.usageFee.rawValue)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                            
                            Spacer()
                            
                            Text("110 Ft")
                                .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                                .font(.system(size: 14, weight: .light))
                        }
                        .padding(.top, 16)
                    }
                    .padding(.top, 28)
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .padding(.top, 24)
                        .padding(.horizontal, 4)
                    
                    AmountView()
                    
                    Button(Constans.Texts.next.rawValue, action: {
                        path.append(Constans.Navigation.success.rawValue)
                    })
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    Button(Constans.Texts.cancel.rawValue, action: {
                        path.removeLast()
                    })
                    .buttonStyle(SecondaryButtonStyle())
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

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
    SummaryView(path: .constant(NavigationPath()))
}
