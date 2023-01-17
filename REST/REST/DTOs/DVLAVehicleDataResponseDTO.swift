//
//  DVLAVehicleDataResponseDTO.swift
//  REST
//
//  Created by Daniel Sutcliffe on 17/01/2023.
//

import Foundation

public struct DVLAVehicleDataResponseDTO: Codable {
    let registrationNumber: String?
    let co2Emissions: Int?
    let engineCapacity: Int?
    let markedForExport: Bool?
    let fuelType: String?
    let motStatus: String?
    let revenueWeight: Int?
    let colour: String?
    let make: String?
    let typeApproval: String?
    let yearOfManufacture: Int?
    let taxDueDate: String?
    let taxStatus: String?
    let dateOfLastV5CIssued: String?
    let motExpiryDate: String?
    let wheelplan: String?
    let monthOfFirstRegistration: String?
}
