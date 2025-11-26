//
//  AppContainer.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation
import Swinject
import OpenAPIRuntime
import OpenAPIURLSession


public final class AppContainer {
    public static let shared = AppContainer()
    
    public var container: Container!
    
    func setProductionContainer() {}
    
    func setMockContainer() {
        container = Container()
        
        container.register(APIProtocol.self) { _ in
            MockClient()
        }
        .inObjectScope(.container)
        container.register(VignetteInteractorType.self) { _ in
            VignetteInteractor()
        }
        .inObjectScope(.container)
    }
}
