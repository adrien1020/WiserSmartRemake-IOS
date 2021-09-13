//
//  CustomTabView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 13/09/2021.
//

import SwiftUI

struct CustomTabView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    var iconName = ["hand.point.up.fill",
                    "thermometer",
                    "wave.3.right.circle.fill",
                    "clock.arrow.circlepath"]
    @State var selectedTab = "hand.point.up.fill"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                HomeModeView()
                    .tag(iconName[0])
                TempView()
                    .tag(iconName[1])
                AppliancesView()
                    .tag(iconName[2])
                ScheduleView()
                    .tag(iconName[3])
            }
            HStack(spacing: 20) {
                ForEach(iconName, id: \.self) { image in
                    TabButton(selectedTab: $selectedTab, image: image)
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 4)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
        }
    }
}
struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
struct TabButton: View {
    @Binding var selectedTab: String
    var image: String
    var body: some View {
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image)
                .font(.system(size: 25))
                .foregroundColor(selectedTab == image ? .green : .black.opacity(0.4))
                .padding()
        })
    }
}
