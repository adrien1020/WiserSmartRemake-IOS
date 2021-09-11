//
//  CardHelper.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 10/09/2021.
//

import SwiftUI

struct CardHelper: View {
    @StateObject var appliancesVM: AppliancesViewModel
    @State var applianceName: String
    @State var powerConsump: Int
    @State var state: Bool
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text(applianceName)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text(String(powerConsump)+"W")
                        .fontWeight(.semibold)
                }
                Divider()
                Toggle("", isOn: $state)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.horizontal, 15)
        .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

struct CardHelper_Previews: PreviewProvider {
    static var previews: some View {
        CardHelper(appliancesVM: AppliancesViewModel(), applianceName: "SmartPlug 1", powerConsump: 100, state: true)
    }
}
