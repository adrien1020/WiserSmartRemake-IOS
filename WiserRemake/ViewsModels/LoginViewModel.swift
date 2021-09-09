//
//  LoginViewModel.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var ipAdress = ""
    @Published var wiserUser = ""
    @Published var wiserPassword = ""
    @Published var login: Data!
    @Published var auth = ""
    @Published var isAuth = false
    func auth(_ ipAdr: String, _ user: String, _ password: String, completionHandler: @escaping(Bool) -> Void) {
        ipAdress = ipAdr
        wiserUser = user
        wiserPassword = password
        let loginString = String(format: "%@:%@", user, password)
        login = loginString.data(using: String.Encoding.utf8)!
        auth = login!.base64EncodedString()
        guard let url = URL(string: ipAdress+Consts.EndPoint.networkStatus) else {fatalError("Invalid URL")}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Basic {}".appending(auth), forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(LoginModel.self, from: data!)
                    DispatchQueue.main.async {
                        print(result)
                        self.isAuth = true
                        completionHandler(self.isAuth)
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
