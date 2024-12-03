//
//  DecoderService.swift
//  Networking
//
//  Created by Rishabh Sharma on 04/11/24.
//

import Foundation

class JSONDecoderService {
    static func decode<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let decodedObject = try decoder.decode(T.self, from: data)
        print(decodedObject)
        return decodedObject
    }
}
