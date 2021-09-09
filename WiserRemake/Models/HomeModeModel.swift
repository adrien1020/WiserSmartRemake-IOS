//
//  HomeModeModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import Foundation

struct HomeModeModel: Decodable {
    struct GetHomeMode: Decodable {
        var homeMode: String
        var antiFreeze: Bool
    }
    struct SetHomeMode: Codable {
        var hcMode: String
        var homeMode: String
        var antiFreeze: Bool
        var endTime: Int
    }
}
