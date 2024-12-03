//
//  Model.swift
//  Networking
//
//  Created by Rishabh Sharma on 21/08/24.
//

import SwiftUI

struct DeviceModel: Codable {
    let id, name: String?
    let data: DataClass?
    
    init(id: String? = nil, name: String? = nil, data: DataClass? = nil) {
            self.id = id
            self.name = name
            self.data = data
        }
    
    func getJSON() -> [String: Any] {
        var params: [String: Any] = ["name": self.name ?? ""]
        
        if let data = self.data {
            params["data"] = data.getJSON()
        }
        
        return params
    }
    
    enum CodingKeys: String, CodingKey {
            case id, name, data
        }
}

// MARK: - DataClass
struct DataClass: Codable {
    let dataColor, dataCapacity: String?
    let capacityGB: Int?
    let dataPrice: Double?
    let dataGeneration: String?
    let year: Int?
    let cpuModel, hardDiskSize, strapColour, caseSize: String?
    let color, description, capacity: String?
    let screenSize: Double?
    let generation, price: String?
    
    init(dataColor: String? = nil,
             dataCapacity: String? = nil,
             capacityGB: Int? = nil,
             dataPrice: Double? = nil,
             dataGeneration: String? = nil,
             year: Int? = nil,
             cpuModel: String? = nil,
             hardDiskSize: String? = nil,
             strapColour: String? = nil,
             caseSize: String? = nil,
             color: String? = nil,
             description: String? = nil,
             capacity: String? = nil,
             screenSize: Double? = nil,
             generation: String? = nil,
             price: String? = nil) {
            
            self.dataColor = dataColor
            self.dataCapacity = dataCapacity
            self.capacityGB = capacityGB
            self.dataPrice = dataPrice
            self.dataGeneration = dataGeneration
            self.year = year
            self.cpuModel = cpuModel
            self.hardDiskSize = hardDiskSize
            self.strapColour = strapColour
            self.caseSize = caseSize
            self.color = color
            self.description = description
            self.capacity = capacity
            self.screenSize = screenSize
            self.generation = generation
            self.price = price
        }
    
    enum CodingKeys: String, CodingKey {
        case dataColor = "color"
        case dataCapacity = "capacity"
        case capacityGB = "capacity GB"
        case dataPrice = "price"
        case dataGeneration = "generation"
        case year
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
        case strapColour = "Strap Colour"
        case caseSize = "Case Size"
        case color = "Color"
        case description = "Description"
        case capacity = "Capacity"
        case screenSize = "Screen size"
        case generation = "Generation"
        case price = "Price"
    }
    
    
    func getJSON() -> [String: Any] {
        var params: [String: Any] = [:]
        params["year"] = year
        params["Price"] = price
        params["CPU model"] = cpuModel
        params["Hard disk size"] = hardDiskSize
        
        // Add optional properties from DataClass
        if let dataColor = dataColor {
            params["color"] = dataColor
        }
        if let dataCapacity = dataCapacity {
            params["capacity"] = dataCapacity
        }
        if let capacityGB = capacityGB {
            params["capacity GB"] = capacityGB
        }
        if let dataPrice = dataPrice {
            params["price"] = dataPrice
        }
        if let dataGeneration = dataGeneration {
            params["generation"] = dataGeneration
        }
        if let strapColour = strapColour {
            params["Strap Colour"] = strapColour
        }
        if let caseSize = caseSize {
            params["Case Size"] = caseSize
        }
        if let color = color {
            params["Color"] = color
        }
        if let description = description {
            params["Description"] = description
        }
        if let capacity = capacity {
            params["Capacity"] = capacity
        }
        if let screenSize = screenSize {
            params["Screen size"] = screenSize
        }
        if let generation = generation {
            params["Generation"] = generation
        }
        return params
    }
}

