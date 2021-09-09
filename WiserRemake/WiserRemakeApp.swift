//
//  WiserRemakeApp.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import SwiftUI

@main
struct WiserRemakeApp: App {
    @StateObject var loginVM = LoginViewModel()
    @StateObject var homeModeVM = HomeModeViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(loginVM)
                .environmentObject(homeModeVM)
        }
    }
}
