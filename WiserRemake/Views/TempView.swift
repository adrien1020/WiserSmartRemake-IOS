//
//  TempView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 19/09/2021.
//

import SwiftUI

struct TempView: View {
    @ObservedObject var tempVM = TempViewModel()
    @EnvironmentObject var loginVM: LoginViewModel
    @State var index = 0
    let gradient = LinearGradient(gradient: Gradient(
                                    colors: [
                                        Color("circle.color.2"),
                                        Color("circle.color.3")]),
                                  startPoint: .bottomLeading ,
                                  endPoint: .topTrailing)
    var body: some View {
        VStack {
            HStack {
                Text("Température")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer(minLength: 0)
            }
            .padding(.top, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<tempVM.tempDetails.count, id: \.self) { index in
                        Button(action: {
                            withAnimation(.default) {
                                print(index)
                                self.index = index
                            }
                        }, label: {
                            Text(tempVM.tempDetails[index].locationName)
                                .foregroundColor(self.index == index ? .white : .black)
                        })
                        .frame(width: 110)
                        .padding(.vertical, 10)
                        .background((gradient).opacity(self.index == index ? 1 : 0))
                        .clipShape(Capsule())
                    }
                }
            }
            .background(Color.gray.opacity(0.15))
            .clipShape(Capsule())
            .padding(.horizontal, 20)
            .navigationBarHidden(true)
            Spacer()
            if tempVM.isLoad {
                if tempVM.tempDetails[index].currentValue != nil {
                    TempThView(tempVM: tempVM, index: $index)
                } else {
                    TempFipView(tempVM: tempVM, index: $index)
                }
            }
            Spacer()
        }
        .onAppear {
            tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
        }
    }
}
struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
