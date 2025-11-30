//
//  File.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

struct MockClient: APIProtocol {
    func postHighwayOrder(_ input: Operations.postHighwayOrder.Input)
    async throws -> Operations.postHighwayOrder.Output {
        let response = stubbedResponse(
            "order"
        )
        if let json: Operations.postHighwayOrder.Output.Ok.Body.jsonPayload = decodeDataToObject(
            data: response
        ) {
            return .ok(
                .init(
                    body: .json(
                        json
                    )
                )
            )
        }
        return .notFound(.init())
    }
    
    func getVehicleInfo(_ input: Operations.getVehicleInfo.Input)
    async throws -> Operations.getVehicleInfo.Output {
        let response = stubbedResponse(
            "vehicleInfo"
        )
        if let json: Operations.getVehicleInfo.Output.Ok.Body.jsonPayload = decodeDataToObject(
            data: response
        ) {
            return .ok(
                .init(
                    body: .json(
                        json
                    )
                )
            )
        }
        return .notFound(.init())
    }
    
    func getHighwayInfo(_ input: Operations.getHighwayInfo.Input)
    async throws -> Operations.getHighwayInfo.Output {
        let response = stubbedResponse(
            "highway"
        )
        if let json: Operations.getHighwayInfo.Output.Ok.Body.jsonPayload = decodeDataToObject(
            data: response
        ) {
            return .ok(
                .init(
                    body: .json(
                        json
                    )
                )
            )
        }
        return .notFound(.init())
    }
}
