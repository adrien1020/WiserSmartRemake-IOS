//
//  ApplianceModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 10/09/2021.
//

import Foundation

struct GetApplianceModel: Decodable {
    var hcMode: String
    var applianceDetails: [ApplianceDetails]
    struct ApplianceDetails: Decodable, Hashable {
        var applianceId: String
        var applianceName: String
        var powerConsump: Int
        var state: Bool
        var modifiable: Bool
        var isSheddable: Bool
        var isUserSheddable: Bool
    }
}
struct SetApplianceModel: Codable {
    var applianceState: [ApplianceState]
    struct ApplianceState: Codable {
        var applianceId: String
        var applianceName: String
        var state: Bool
    }
}
