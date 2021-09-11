//
//  DatePickerHelper.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import SwiftUI

struct DatePickerHelper: View {
    @State private var date = Date()
    var body: some View {
        VStack {
            DatePicker("Enter your birthday", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(width: 300, height: 300)
        .background(Color.white)
    }
}
}
struct DatePickerHelper_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerHelper()
    }
}
