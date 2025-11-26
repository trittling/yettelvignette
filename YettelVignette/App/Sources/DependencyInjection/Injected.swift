//
//  Injected.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import SwiftUI
import Combine
import Swinject

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T

    init() {
        self.wrappedValue = AppContainer.shared.container.resolve(T.self)!
    }
}

@propertyWrapper
struct InjectedObject<T>: DynamicProperty where T: ObservableObject {
    @ObservedObject private var service: T

    public init() {
        self.service = AppContainer.shared.container.resolve(T.self)!
    }

    public var wrappedValue: T {
        get { return service }
        mutating set { service = newValue }
    }

    public var projectedValue: ObservedObject<T>.Wrapper {
        return self.$service
    }
}
