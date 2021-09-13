//
//  HomeModeView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import SwiftUI

struct HomeModeView: View {
    @EnvironmentObject var homeModeVM: HomeModeViewModel
    @EnvironmentObject var loginVM: LoginViewModel
    @State private var holidayDate = Date()
    @State private var isManual = false
    @State private var isHoliday = false
    @State private var isSchedule = false
    @State private var isEnergySaver = false
    let gradient = LinearGradient(gradient: Gradient(
                                    colors: [Color("circle.color.1") ,
                                             Color("circle.color.2"),
                                             Color("circle.color.3")]),
                                  startPoint: .bottomTrailing ,
                                  endPoint: .bottomLeading)
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.10))
                    .frame(width: 300, height: 300, alignment: .center)
                Circle()
                    .fill(Color.white)
                    .overlay(Circle().stroke(gradient, lineWidth: 4))
                    .frame(width: 200, height: 200, alignment: .center)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
                // Schedule Button
                ButtonMode(ipAdr: Consts.Url.ipAdress,
                           auth: loginVM.auth,
                           iconName: "clock.arrow.circlepath",
                           iconNumber: 0,
                           state: $isSchedule,
                           rotationDegrees: 0,
                           setHomeMode: HomeModeModel.SetHomeMode(hcMode: "schedule",
                                                                  homeMode: "schedule",
                                                                  antiFreeze: false,
                                                                  endTime: 0))
                // Holiday Button
                ButtonMode(ipAdr: Consts.Url.ipAdress,
                           auth: loginVM.auth,
                           iconName: "sun.max",
                           iconNumber: 1,
                           state: $isHoliday,
                           rotationDegrees: -90,
                           setHomeMode: HomeModeModel.SetHomeMode(hcMode: "holiday",
                                                                  homeMode: "holiday",
                                                                  antiFreeze: false,
                                                                  endTime: 0))
                // EnergySaver Button
                ButtonMode(ipAdr: Consts.Url.ipAdress,
                           auth: loginVM.auth,
                           iconName: "leaf",
                           iconNumber: 2,
                           state: $isEnergySaver,
                           rotationDegrees: -180,
                           setHomeMode: HomeModeModel.SetHomeMode(hcMode: "energysaver",
                                                                  homeMode: "energysaver",
                                                                  antiFreeze: false,
                                                                  endTime: 0))
                // Manual Button
                ButtonMode(ipAdr: Consts.Url.ipAdress,
                           auth: loginVM.auth,
                           iconName: "hand.point.up",
                           iconNumber: 3,
                           state: $isManual,
                           rotationDegrees: 90,
                           setHomeMode: HomeModeModel.SetHomeMode(hcMode: "manual",
                                                                  homeMode: "manual",
                                                                  antiFreeze: false,
                                                                  endTime: 0))
                Text(homeModeVM.homeMode)
                    .font(.title2)
                    .onChange(of: homeModeVM.homeMode, perform: {value in
                        print(value)
                        if value == "manual"{
                            isManual.toggle()
                            isSchedule = false
                            isHoliday = false
                            isEnergySaver = false
                        } else if value == "schedule" {
                            isManual = false
                            isSchedule.toggle()
                            isHoliday = false
                            isEnergySaver = false
                        } else if value == "holiday" {
                            isManual = false
                            isSchedule = false
                            isHoliday.toggle()
                            isEnergySaver = false
                        } else {
                            isManual = false
                            isSchedule = false
                            isHoliday = false
                            isEnergySaver.toggle()
                        }
                    })
            }
        }
        .navigationBarHidden(true)
    }
}

struct HomeModeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeModeView()
    }
}
struct ButtonMode: View {
    @EnvironmentObject var homeModeVM: HomeModeViewModel
    @EnvironmentObject var loginModeVM: LoginViewModel
    @State var ipAdr: String
    @State var auth: String
    @State var iconName: String
    @State var iconNumber: Int
    @Binding var state: Bool
    @State var rotationDegrees: Double
    @State var setHomeMode: HomeModeModel.SetHomeMode
    var body: some View {
        Button(action: {
            homeModeVM.setHomeMode(ipAdr, auth, sethomeMode: setHomeMode, completionHandler: {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    homeModeVM.getHomeMode(ipAdr, auth)
                })
            })
        }, label: {
            Image(systemName: iconName)
                .font(.system(size: 32))
                .foregroundColor(state ? .green : .black)
        })
        .rotationEffect(.degrees((rotationDegrees)))
        .offset(x: (250)/2)
        .rotationEffect(.init(degrees: Double(iconNumber)*90))
    }
}
