//
//  AppNetworking.swift
//  Networking
//
//  Created by Rishabh Sharma on 18/07/24.
//

import Foundation

class AppNetworking {
    static func buildRequest(from router: Router) throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.query
        
        guard let url = components.url else {
            throw NetworkError.customError("Invalid URL")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.timeoutInterval = 30

        switch router.method {
        case "GET":
            urlRequest.httpBody = try getApiRequest()
        case "POST":
            urlRequest.httpBody = try postApiRequest(from: router)
        case "PUT":
            urlRequest.httpBody = try putApiRequest(from: router)
        case "DELETE":
            urlRequest.httpBody = try deleteApiRequest(from: router)
        case "PATCH":
            urlRequest.httpBody = try patchApiRequest(from: router)
        default:
            urlRequest.httpBody = try getApiRequest()
        }
        
        logRequest(urlRequest)
        return urlRequest
    }
    
    private static func logRequest(_ request: URLRequest) {
        print("Request: \(request)")
    }
}

extension AppNetworking {
    
    static func getApiRequest() throws -> Data? {
        return nil
    }
    
    static func postApiRequest(from router: Router) throws -> Data? {
        var data : Data?
        do {
            data = try JSONSerialization.data(withJSONObject: router.parameters, options: .prettyPrinted)
        } catch let error {
            throw NetworkError.customError("Unsupported HTTP method: \(router.method)")
        }
        return data
    }
    
    static func putApiRequest(from router: Router) throws -> Data? {
        var data : Data?
        do {
            data = try JSONSerialization.data(withJSONObject: router.parameters, options: .prettyPrinted)
        } catch let error {
            throw NetworkError.customError("Unsupported HTTP method: \(router.method)")
        }
        return data
    }
    
    static func deleteApiRequest(from router: Router) throws -> Data? {
        var data : Data?
        do {
            data = try JSONSerialization.data(withJSONObject: router.parameters, options: .prettyPrinted)
        } catch let error {
            throw NetworkError.customError("Unsupported HTTP method: \(router.method)")
        }
        return data
    }
    
    static func patchApiRequest(from router: Router) throws -> Data? {
        var data : Data?
        do {
            data = try JSONSerialization.data(withJSONObject: router.parameters, options: .prettyPrinted)
        } catch let error {
            throw NetworkError.customError("Unsupported HTTP method: \(router.method)")
        }
        return data
    }
}
