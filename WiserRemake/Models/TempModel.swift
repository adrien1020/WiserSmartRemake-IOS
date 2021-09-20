//
//  TempModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 11/09/2021.
//

import Foundation

struct GetTemperaturesModel: Decodable {
    var hcMode: String
    var locationTempDetails: [LocationTempDetails]
    struct LocationTempDetails: Decodable, Hashable {
        var locationId: String
        var locationName: String
        var unit: String
        var targetValue: Float
        var currentValue: Float?
        var minValue: Float?
        var maxValue: Float?
    }
}
struct SetTemperaturesModel: Codable {
    var targetTemp: [TargetTemp]
    struct TargetTemp: Codable {
        var locationId: String
        var targetValue: Float
    }
}
