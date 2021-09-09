//
//  HomeModeViewModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import Foundation

class HomeModeViewModel: ObservableObject {
    @Published var homeMode: String = ""
    @Published var antiFreeze: Bool = false
    func getHomeMode (_ ipAdr: String, _ auth: String) {
        guard let url = URL(string: ipAdr+Consts.EndPoint.getHomeMode) else {fatalError("Invalid URL")}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Basic {}".appending(auth), forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(HomeModeModel.GetHomeMode.self, from: data!)
                    DispatchQueue.main.async {
                        self.homeMode = result.homeMode
                        self.antiFreeze = result.antiFreeze
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
    func setHomeMode(_ ipAdr: String, _ auth: String, sethomeMode: HomeModeModel.SetHomeMode, completionHandler : @escaping () -> Void) {
        guard let url = URL(string: ipAdr+Consts.EndPoint.setHomeMode) else {fatalError("Invalid URL")}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Basic {}".appending(auth), forHTTPHeaderField: "Authorization")
        do {
            completionHandler()
            request.httpBody = try JSONEncoder().encode(sethomeMode)
        } catch {
         print(error)
            print(error.localizedDescription)
        }
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil {
                print(data!)
            } else {
                print("2")
                print(error!.localizedDescription)
            }
        }
        task.resume()
    }
}
