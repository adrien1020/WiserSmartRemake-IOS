//
//  ScheduleView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 13/09/2021.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        ScrollableDayHelper()
            .navigationBarHidden(true)
        Spacer()
        Text("Work in progress")
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
