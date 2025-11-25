//
//  ConfettiView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct ConfettiView: View {
    @State private var animate = false
    @State private var xSpeed = Double.random(in: 0.7...2.0)
    @State private var zSpeed = Double.random(in: 1.0...2.0)
    @State private var anchor = CGFloat.random(in: 0...1).rounded()

    var body: some View {
        Rectangle()
            .fill([.orange, .green, .blue, .red, .yellow].randomElement() ?? .green)
            .frame(width: 8, height: 8)
            .onAppear { animate = true }
            .rotation3DEffect(.degrees(animate ? 360 : 0), axis: (x: 1, y: 0, z: 0))
            .animation(.linear(duration: xSpeed).repeatForever(autoreverses: false), value: animate)
            .rotation3DEffect(.degrees(animate ? 360 : 0),
                              axis: (x: 0, y: 0, z: 1),
                              anchor: UnitPoint(x: anchor, y: anchor))
            .animation(.linear(duration: zSpeed).repeatForever(autoreverses: false), value: animate)
    }
}

struct ConfettiContainerView: View {
    var count: Int = 50
    @State private var ySeed: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(0..<count, id: \.self) { _ in
                    ConfettiView()
                        .position(
                            x: CGFloat.random(in: 0...geo.size.width),
                            y: ySeed == 0 ? 0 : CGFloat.random(in: 0...geo.size.height)
                        )
                }
            }
            .ignoresSafeArea()
            .onAppear { ySeed = .random(in: 0...geo.size.height) }
        }
    }
}

struct DisplayConfettiModifier: ViewModifier {
    @Binding var isActive: Bool {
        didSet { if !isActive { opacity = 1 } }
    }
    @State private var opacity = 1.0 {
        didSet { if opacity == 0 { isActive = false } }
    }

    private let animationTime = 3.0
    private let fadeTime = 1.6

    func body(content: Content) -> some View {
        if #available(iOS 17, *) {
            content
                .overlay(isActive ? ConfettiContainerView().opacity(opacity) : nil)
                .sensoryFeedback(.success, trigger: isActive)
        } else {
            content
                .overlay(isActive ? ConfettiContainerView().opacity(opacity) : nil)
        }
    }
}

extension View {
    func displayConfetti(isActive: Binding<Bool>) -> some View {
        modifier(DisplayConfettiModifier(isActive: isActive))
    }
}
