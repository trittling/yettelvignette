//
//  VignetteInteractor.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

protocol VignetteInteractorType {
    func getVehicleInfo()
    async -> Result<VehicleInfo, VehicleInfoError>
    
    func getHighwayInfo()
    async -> Result<HighwayInfo, HighwayInfoError>
    
    func postOrder(orderRequest: HighwayOrderRequest)
    async -> Result<OrderResponse, HighwayOrderError>
}

final actor VignetteInteractor: VignetteInteractorType {
    @Injected var client: APIProtocol
    
    func getVehicleInfo() async -> Result<VehicleInfo, VehicleInfoError> {
        do {
            let response = try await self.client.getVehicleInfo(Operations.getVehicleInfo.Input())
            
            if case let .ok(okResponse) = response {
                return await .success(self.mapVehicleInfo(from: try okResponse.body.json))
            } else {
                return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
    
    func getHighwayInfo() async -> Result<HighwayInfo, HighwayInfoError> {
        do {
            let response = try await self.client.getHighwayInfo(Operations.getHighwayInfo.Input())
            
            if case let .ok(okResponse) = response {
                return await .success(self.mapHighwayInfo(from: try okResponse.body.json))
            } else {
                return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
    
    @MainActor
    func postOrder(orderRequest: HighwayOrderRequest) async -> Result<OrderResponse, HighwayOrderError> {
        do {
            let payload = Operations.postHighwayOrder.Input.Body.jsonPayload(highwayOrders: orderRequest.highwayOrders.map { .init(_type: $0.type, category: $0.category, cost: Float($0.cost)) })
            let input = Operations.postHighwayOrder.Input(body: .json(payload))
            
            let response = try await self.client.postHighwayOrder(input)
            
            if case let .ok(okResponse) = response {
                return await .success(self.mapPostHigwayOrder(from: try okResponse.body.json))
            } else {
                return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
}

private extension VignetteInteractor {
    func mapVehicleInfo(from apiModel: Operations.getVehicleInfo.Output.Ok.Body.jsonPayload) -> VehicleInfo {
        return VehicleInfo(statusCode: apiModel.statusCode ?? "",
                           internationalRegistrationCode: apiModel.internationalRegistrationCode ?? "",
                           type: apiModel._type ?? "",
                           name: apiModel.name ?? "",
                           plate: apiModel.plate ?? "",
                           country: VehicleInfo.Country(hu: apiModel.country?.hu ?? "", en: apiModel.country?.en ?? ""),
                           vignetteType: apiModel.vignetteType ?? ""
        )
    }
    
    func mapHighwayInfo(from apiModel: Operations.getHighwayInfo.Output.Ok.Body.jsonPayload) -> HighwayInfo {
        var highwayVignettes = [HighwayVignette]()
        for vignette in apiModel.payload?.highwayVignettes ?? [] {
            let highwayVignette = HighwayVignette(vignetteType: vignette.vignetteType ?? [],
                                                  vehicleCategory: vignette.vehicleCategory ?? "",
                                                  cost: Int(vignette.cost ?? 0.0),
                                                  trxFee: Int(vignette.trxFee ?? 0.0),
                                                  sum: Int(vignette.sum ?? 0.0))
            highwayVignettes.append(highwayVignette)
        }
        
        var counties = [County]()
        for county in apiModel.payload?.counties ?? [] {
            counties.append(County(id: county.id ?? "",
                                   name: county.name ?? ""))
        }
        
        return HighwayInfo(highwayVignettes: highwayVignettes,
                           vehicleCategories: apiModel.payload?.vehicleCategories as? [VehicleCategory] ?? [],
                           counties: counties,
                           requestId: apiModel.requestId ?? "",
                           statusCode: apiModel.statusCode ?? "",
                           dataType: apiModel.payload.debugDescription)
    }
    
    func mapPostHigwayOrder(from apiModel: Operations.postHighwayOrder.Output.Ok.Body.jsonPayload) -> OrderResponse {
        var receivedOrders: [ReceivedOrder] = []
        for order in apiModel.receivedOrders ?? [] {
            receivedOrders.append(ReceivedOrder(type: order._type ?? "",
                                                category: order.category ?? "",
                                                cost: Int(order.cost ?? 0.0)))
        }
        
        return OrderResponse(statusCode: apiModel.statusCode ?? "",
                             receivedOrders: receivedOrders)
    }
}
