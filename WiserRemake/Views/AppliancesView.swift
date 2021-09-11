//
//  AppliancesView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 10/09/2021.
//

import SwiftUI

struct AppliancesView: View {
    @EnvironmentObject var homeModeVM: HomeModeViewModel
    @EnvironmentObject var loginVM: LoginViewModel
    @StateObject var appliancesVM = AppliancesViewModel()
    @State var changeState = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                if appliancesVM.isLoad {
                    ForEach(appliancesVM.applianceDetails.indices) { index in
                        VStack {
                            VStack(spacing: 20) {
                                HStack {
                                    Text(appliancesVM.applianceDetails[index].applianceName)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    Spacer()
                                    Text(String(appliancesVM.applianceDetails[index].powerConsump)+"W")
                                        .fontWeight(.semibold)
                                }
                                Divider()
                                Toggle("", isOn: $appliancesVM.applianceDetails[index].state)
                            }
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .padding(.horizontal, 15)
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                        .onChange(of: appliancesVM.applianceDetails[index].state, perform: { state in
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                appliancesVM.setAppliances(Consts.Url.ipAdress, loginVM.auth,
                                                           setApplianceModel: SetApplianceModel(
                                                            applianceState:
                                                                [SetApplianceModel.ApplianceState(
                                                                    applianceId: appliancesVM.applianceDetails[index].applianceId,
                                                                    applianceName: appliancesVM.applianceDetails[index].applianceName,
                                                                    state: state)]),
                                                           completionHandler: { value in
                                                            print(value)
                                                           })
                            })
                        })
                    }
                }
            }
            .onAppear {
                appliancesVM.getAppliances(Consts.Url.ipAdress, loginVM.auth)
            }
            Spacer()
        }
    }
}

struct AppliancesView_Previews: PreviewProvider {
    static var previews: some View {
        AppliancesView()
    }
}
