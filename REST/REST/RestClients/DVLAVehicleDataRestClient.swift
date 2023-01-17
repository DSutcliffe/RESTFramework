//
//  DVLAVehicleDataRestClient.swift
//  REST
//
//  Created by Daniel Sutcliffe on 17/01/2023.
//

import Foundation

public protocol DVLAVehicleDataRestClientProtocol {
    typealias Completion = (Result<DVLAVehicleDataResponseDTO, Error>) -> Void
    func getVehicleData(completion: @escaping Completion)
}

public class DVLAVehicleDataRestClient: DVLAVehicleDataRestClientProtocol {
    
    let siteURL = URL(string: "https://driver-vehicle-licensing.api.gov.uk/vehicle-enquiry/v1/vehicles")
    let header = ["x-api-key": "312RZv5yWYaF8FGZVP03q6K1ijCI71j73fWFzYHK", "Content-Type": "application/json"]
    
    public init() {
        
    }
    
    public func getVehicleData(completion: @escaping Completion) {
        var request = URLRequest(url: siteURL!, cachePolicy: .useProtocolCachePolicy)

        request.allHTTPHeaderFields = header

        let registrationNumber = "XDJ 5X"

        let jsonObject = ["registrationNumber": "\(registrationNumber)"]

        do {
            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
            request.httpBody = requestBody
        } catch {
            print("Error creating the data object from json")
        }

        request.httpMethod = "POST"

        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let safeData = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.decodeJSON(vehicleData: safeData)
            }
        }

        task.resume()
    }
    
    private func decodeJSON(vehicleData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(DVLAVehicleDataResponseDTO.self, from: vehicleData)
            
            if decodedData.make == nil {
                print("No Records Found!")
            } else {
                print(decodedData)
            }
        } catch {
            print("Error in parseJSON")
        }
    }
    
}
