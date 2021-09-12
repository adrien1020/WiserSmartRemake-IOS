//
//  Constants.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import Foundation

struct Consts {
    struct Url {
        static let ipAdress = "http://192.168.1.41"
    }
    struct EndPoint {
        static let networkStatus = "/rpc/commissioning/network_status"
        static let getHomeMode = "/rpc/mode/get_home_mode"
        static let setHomeMode = "/rpc/mode/set_home_mode"
        static let getAppliances = "/rpc/loadmanagement/get_appliances"
        static let setAppliances = "/rpc/loadmanagement/set_appliance_state"
        static let getTemperatures  = "/rpc/hvac/get_all_loc_temp"
    }
}
