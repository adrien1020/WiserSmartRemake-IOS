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
    struct LocationTempDetails: Decodable {
        var locationId: String
        var locationName: String
        var unit: String
        var currentValue: Float
    }
}
