//
//  TempView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 11/09/2021.
//

import SwiftUI

struct TempView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @ObservedObject private var tempVM = TempViewModel()
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    @State var currentTemp: Float = 0
    let gradient = LinearGradient(gradient: Gradient(
                                    colors: [Color("circle.color.1") ,
                                             Color("circle.color.2"),
                                             Color("circle.color.3")]),
                                  startPoint: .bottomTrailing ,
                                  endPoint: .bottomLeading)
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color("gauge.color"))
                    .frame(width: 300, height: 300, alignment: .center)
                Circle()
                    .fill(Color.white)
                    .overlay(Circle().stroke(gradient, lineWidth: 4))
                    .frame(width: 200, height: 200, alignment: .center)
                    .rotationEffect(.init(degrees: -angle))
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(gradient, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                    .frame(width: 250, height: 250, alignment: .center)
                    .rotationEffect(.init(degrees: -210))
                Circle()
                    .fill(Color.white)
                    .frame(width: 40, height: 40)
                    .offset(x: 250/2)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -210))
                VStack(spacing: 10) {
                    if tempVM.isLoad {
                        Text(String(tempVM.tempDetails[0].currentValue)+" °C")
                            .fontWeight(.heavy)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        withAnimation(Animation.linear(duration: 0.5)) {
                            Text(String(format: "%.1f", angle/5)+" °C")
                                .fontWeight(.heavy)
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .onAppear {
                tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    withAnimation(Animation.linear(duration: 0.5)) {
                        if tempVM.isLoad {
                            self.currentTemp = tempVM.tempDetails[0].currentValue*5
                            self.angle = Double(self.currentTemp)
                            self.progress = CGFloat((self.angle / 360))
                        }
                    }
                })
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
    func onDrag(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radian = atan2(vector.dy - 22.5, vector.dx - 22.5)
        var angle = radian * 180 / .pi
        if angle < 0 {
            angle = 360 + angle
        }
        withAnimation(Animation.linear(duration: 0.15)) {
            let progress = angle / 360
            if angle <= 240 {
                self.angle = Double(angle)
                self.progress = progress
            }
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView().environmentObject(LoginViewModel())
    }
}
