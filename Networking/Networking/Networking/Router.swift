//
//  Router.swift
//  Networking
//
//  Created by Rishabh Sharma on 18/07/24.
//

//   https:// api.restful-api.dev /objects id=1
//--scheme--  -----host----- ------path-- --query---

import Foundation

enum Router {
    case restGetIdApi(id: String)
    case restGetApi
    case restPostApi(elementObject :DeviceModel)
    
    var scheme: String {
        switch self {
        case .restGetApi, .restPostApi, .restGetIdApi:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .restGetApi, .restPostApi, .restGetIdApi:
            return "api.restfulewds-api.dev"
        }
    }
    
    var path: String {
        switch self {
        case .restGetApi, .restPostApi, .restGetIdApi:
            return "/objects"
        }
    }
    
    var method: String {
        switch self {
        case.restGetApi, .restGetIdApi:
            return "GET"
        case .restPostApi:
            return "POST"
        }
      }
    
    var parameters: [String: Any] {
        switch self {
        case .restGetApi, .restGetIdApi:
            return [:]
        case .restPostApi(let elementObject):
            return elementObject.getJSON()
        }
      }
    
    var query: [URLQueryItem] {
        switch self {
        case .restGetIdApi(let id):
            var query: [URLQueryItem] = []
            query.append(URLQueryItem(name: "id", value: id))
          return query
        case .restGetApi:
            return []
        case .restPostApi:
            return []
        }
      }
}
