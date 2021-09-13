//
//  LoginView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 09/09/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @EnvironmentObject var homeModeVM: HomeModeViewModel
    @State private var wiserUser = "admin"
    @State private var wiserPassword = "admin"
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image("wiser.logo")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
                VStack(spacing: 30) {
                    VStack(spacing: 15) {
                        TextField("User", text: $wiserUser)
                            .textCase(.lowercase)
                            .padding()
                            .frame(height: 40)
                            .multilineTextAlignment(.center)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
                        SecureField("Password", text: $wiserPassword)
                            .textCase(.lowercase)
                            .padding()
                            .frame(height: 40)
                            .multilineTextAlignment(.center)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
                    }
                    .padding(.horizontal, 30)
                    NavigationLink(destination: CustomTabView(), isActive: $loginVM.isAuth) {
                        Button(action: {
                            loginVM.auth(Consts.Url.ipAdress,
                                         wiserUser,
                                         wiserPassword,
                                         completionHandler: { isAuth in
                                            if isAuth {
                                                homeModeVM.getHomeMode(loginVM.ipAdress, loginVM.auth)
                                            }
                                         })
                        }, label: {
                            Text("Se Connecter")
                                .frame(width: 150, height: 32, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(Color.green)
                                .cornerRadius(10)
                        })
                    }
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
