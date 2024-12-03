//
//  ServiceLayer.swift
//  Networking
//
//  Created by Rishabh Sharma on 18/07/24.
//

import Foundation

class ServiceLayer {

    static func request<T: Codable>(router: Router) async throws -> T {
        let request = try AppNetworking.buildRequest(from: router)
        let data = try await NetworkManager.requestData(for: request)
        let responseObject: T = try JSONDecoderService.decode(data: data)
        return responseObject
    }
}
