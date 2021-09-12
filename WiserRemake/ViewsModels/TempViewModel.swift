//
//  TempViewModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 11/09/2021.
//

import Foundation

class TempViewModel: ObservableObject {
    @Published var tempDetails: [GetTemperaturesModel.LocationTempDetails] = []
    @Published var isLoad = false
    func getTemperatures(_ ipAdr: String, _ auth: String) {
        guard let url = URL(string: ipAdr+Consts.EndPoint.getTemperatures) else {fatalError("Invalid URL")}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Basic {}".appending(auth), forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(GetTemperaturesModel.self, from: data!)
                    DispatchQueue.main.async {
                        self.tempDetails = result.locationTempDetails
                        print(self.tempDetails)
                        self.isLoad = true
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print(error!.localizedDescription)
            }
        }
        task.resume()
    }
}
