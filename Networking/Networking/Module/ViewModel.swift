//
//  ViewModel.swift
//  Networking
//
//  Created by Rishabh Sharma on 18/07/24.
//

import Foundation

//@Observable
class ViewModel {
    
    var result : [DeviceModel]?
    
    func fetchData() {
        Task {
            do {
                result = try await ServiceLayer.request(router: .restGetApi)
            } catch {
                ErrorHandler.handle(error: error)
            }
        }
    }
    
    func postDataWithParam() {
        let param = DeviceModel(name: "Nothing", data: DataClass(year: 2022, cpuModel: "CSF", color: "White"))
        
        Task {
            do {
                let _ : DeviceModel = try await ServiceLayer.request(router: .restPostApi(elementObject: param))
            } catch {
                ErrorHandler.handle(error: error)
            }
        }
    }
    
    func getDataWithQuery() {
        Task {
            do {
                result = try await ServiceLayer.request(router: .restGetIdApi(id: "2"))
            } catch {
                ErrorHandler.handle(error: error)
            }
        }
    }
}
