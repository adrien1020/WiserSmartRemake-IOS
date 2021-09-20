//
//  TempThView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 11/09/2021.
//

import SwiftUI

struct TempThView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @ObservedObject var tempVM: TempViewModel
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    @State var currentTemp: Float = 0
    @State var gestureCircle: CGFloat = 40
    @Binding var index: Int
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
                    .trim(from: 0, to: 240/360)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 4, lineCap: .butt))
                    .frame(width: 300, height: 300, alignment: .center)
                    .rotationEffect(.init(degrees: 150))
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
                    .frame(width: gestureCircle, height: gestureCircle)
                    .offset(x: 250/2)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(DragGesture().onChanged(onDrag(value:)).onEnded(endDrag(value:)))
                    .rotationEffect(.init(degrees: -210))
                VStack(spacing: 10) {
                    if tempVM.isLoad {
                        Text(tempVM.tempDetails[index].locationName)
                            .fontWeight(.heavy)
                        if tempVM.tempDetails[index].currentValue != nil {
                            Text(String(tempVM.tempDetails[index].currentValue!)+" °C")
                                .fontWeight(.heavy)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                    withAnimation(Animation.linear(duration: 0.5)) {
                        Text(String(format: "%.1f", angle/8)+" °C")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onChange(of: index, perform: {_ in
                withAnimation(Animation.linear(duration: 0.5)) {
                self.currentTemp = tempVM.tempDetails[index].targetValue*8
                self.angle = Double(self.currentTemp)
                self.progress = CGFloat((self.angle / 360))
                }
            })
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    withAnimation(Animation.linear(duration: 0.5)) {
                        if tempVM.isLoad {
                        if tempVM.tempDetails[index].currentValue != nil {
                            self.currentTemp = tempVM.tempDetails[index].targetValue*8
                            self.angle = Double(self.currentTemp)
                            self.progress = CGFloat((self.angle / 360))
                        }
                        }
                    }
                })
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
    func onDrag(value: DragGesture.Value) {
        print(value)
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radian = atan2(vector.dy - gestureCircle/2, vector.dx - gestureCircle/2)
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
    func endDrag(value: DragGesture.Value) {
        tempVM.setTemperature(Consts.Url.ipAdress,
                              loginVM.auth,
                              SetTemperaturesModel(targetTemp:
                                                    [SetTemperaturesModel.TargetTemp(
                                                        locationId: tempVM.tempDetails[index].locationId,
                                                        targetValue: Float(angle/8))]),
                              completionHandler: { value in
                                print(value)
                              })
    }
}

/*
 struct TempThView_Previews: PreviewProvider {
 static var previews: some View {
 TempThView(, index: ).environmentObject(LoginViewModel())
 }
 }*/
