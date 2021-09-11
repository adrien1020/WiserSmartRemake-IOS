//
//  AppliancesViewModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 10/09/2021.
//

import Foundation

class AppliancesViewModel: ObservableObject {
    @Published var applianceDetails: [GetApplianceModel.ApplianceDetails] = []
    @Published var isLoad = false
    func getAppliances(_ ipAdr: String, _ auth: String) {
        guard let url = URL(string: ipAdr+Consts.EndPoint.getAppliances) else {fatalError("Invalid URL")}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Basic {}".appending(auth), forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(GetApplianceModel.self, from: data!)
                    DispatchQueue.main.async {
                        self.applianceDetails = result.applianceDetails
                        print(self.applianceDetails)
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
    func setAppliances(_ ipAdr: String, _ auth: String, setApplianceModel: SetApplianceModel,
                       completionHandler: @escaping (Bool) -> Void) {
        guard let url = URL(string: ipAdr+Consts.EndPoint.setAppliances) else {fatalError("Invalid URL")}
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Basic {}".appending(auth), forHTTPHeaderField: "Authorization")
        do {
            request.httpBody = try JSONEncoder().encode(setApplianceModel)
            print("1")
        } catch {
            print(error.localizedDescription)
        }
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil {
                print(data!)
                completionHandler(true)
            } else {
                print("2")
                print(error!.localizedDescription)
            }
        }
        task.resume()
    }
}
