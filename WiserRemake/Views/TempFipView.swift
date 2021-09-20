//
//  TempFipView.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 19/09/2021.
//

import SwiftUI

struct TempFipView: View {
    @ObservedObject var tempVM: TempViewModel
    @EnvironmentObject var loginVM: LoginViewModel
    @Binding var index: Int
    @State var selected: Int = 0
    @State var selMode = ""
    var tempSel = ["Confort", "Confort -1°C", "Confort -2°C", "Eco", "Hors Gel", "Off"]
    let gradient = LinearGradient(gradient: Gradient(
                                    colors: [
                                        Color("circle.color.2"),
                                        Color("circle.color.3")]),
                                  startPoint: .bottomLeading ,
                                  endPoint: .topTrailing)
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.10))
                .frame(width: 300, height: 300, alignment: .center)
            Circle()
                .fill(Color.white)
                .overlay(Circle().stroke(Color.green, lineWidth: 4))
                .frame(width: 200, height: 200, alignment: .center)
                .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
            Circle()
                .trim(from: 0, to: (1*60)/360)
                .stroke(selected == 0 ? Color.green : Color.white, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.init(degrees: 30))
                .opacity(selected == 0 ? 1 : 0.01)
                .onTapGesture {
                    withAnimation {
                        self.selected = 0
                    }
                    tempVM.setTemperature(Consts.Url.ipAdress,
                                          loginVM.auth, SetTemperaturesModel(
                                            targetTemp: [SetTemperaturesModel.TargetTemp(
                                                            locationId: tempVM.tempDetails[index].locationId,
                                                            targetValue: Float(selected))]),
                                          completionHandler: { _ in
                                            tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                                self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                                            })
                                          })
                }
            Circle()
                .trim(from: 0, to: (1*60)/360)
                .stroke(selected == 1 ? Color.green : Color.white, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.init(degrees: 90))
                .opacity(selected == 1 ? 1 : 0.01)
                .onTapGesture {
                    withAnimation {
                        print("2")
                        self.selected = 1
                    }
                    tempVM.setTemperature(Consts.Url.ipAdress,
                                          loginVM.auth, SetTemperaturesModel(
                                            targetTemp: [SetTemperaturesModel.TargetTemp(
                                                            locationId: tempVM.tempDetails[index].locationId,
                                                            targetValue: Float(selected))]),
                                          completionHandler: { _ in
                                            tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                                self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                                            })
                                          })
                }
            Circle()
                .trim(from: 0, to: (1*60)/360)
                .stroke(selected == 2 ? Color.green : Color.white, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.init(degrees: 150))
                .opacity(selected == 2 ? 1 : 0.01)
                .onTapGesture {
                    withAnimation {
                        self.selected = 2
                    }
                    tempVM.setTemperature(Consts.Url.ipAdress,
                                          loginVM.auth, SetTemperaturesModel(
                                            targetTemp: [SetTemperaturesModel.TargetTemp(
                                                            locationId: tempVM.tempDetails[index].locationId,
                                                            targetValue: Float(selected))]),
                                          completionHandler: { _ in
                                            tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                                self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                                            })
                                          })
                }
            Circle()
                .trim(from: 0, to: (1*60)/360)
                .stroke(selected == 3 ? Color.green : Color.white, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.init(degrees: 210))
                .opacity(selected == 3 ? 1 : 0.01)
                .onTapGesture {
                    withAnimation {
                        self.selected = 3
                    }
                    tempVM.setTemperature(Consts.Url.ipAdress,
                                          loginVM.auth, SetTemperaturesModel(
                                            targetTemp: [SetTemperaturesModel.TargetTemp(
                                                            locationId: tempVM.tempDetails[index].locationId,
                                                            targetValue: Float(selected))]),
                                          completionHandler: { _ in
                                            tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                                self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                                            })
                                          })
                }
            Circle()
                .trim(from: 0, to: (1*60)/360)
                .stroke(selected == 4 ? Color.green : Color.white, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.init(degrees: 270))
                .opacity(selected == 4 ? 1 : 0.01)
                .onTapGesture {
                    DispatchQueue.main.async {
                        withAnimation {
                            self.selected = 4
                        }
                        tempVM.setTemperature(Consts.Url.ipAdress,
                                              loginVM.auth, SetTemperaturesModel(
                                                targetTemp: [SetTemperaturesModel.TargetTemp(
                                                                locationId: tempVM.tempDetails[index].locationId,
                                                                targetValue: Float(selected))]),
                                              completionHandler: { _ in
                                                tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                                                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                                    self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                                                })
                                              })
                    }
                }
            Circle()
                .trim(from: 0, to: (1*60)/360)
                .stroke(selected == 5 ? Color.green : Color.white, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.init(degrees: 330))
                .opacity(selected == 5 ? 1 : 0.01)
                .onTapGesture {
                    withAnimation {
                        self.selected = 5
                    }
                    tempVM.setTemperature(Consts.Url.ipAdress,
                                          loginVM.auth, SetTemperaturesModel(
                                            targetTemp: [SetTemperaturesModel.TargetTemp(
                                                            locationId: tempVM.tempDetails[index].locationId,
                                                            targetValue: Float(selected))]),
                                          completionHandler: { _ in
                                            tempVM.getTemperatures(Consts.Url.ipAdress, loginVM.auth)
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                                self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                                            })
                                          })
                }
            if tempVM.tempDetails[index].currentValue == nil {
                Text(selMode)
                    .kerning(5)
                    .rotationEffect(.init(degrees: 90))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                if tempVM.tempDetails[index].currentValue == nil {
                    self.selected = Int(tempVM.tempDetails[index].targetValue)
                    self.selMode = tempSel[Int(tempVM.tempDetails[index].targetValue)]
                    print(self.selected)
                }
            })
        }
    }
}

/*
 struct TempFipView_Previews: PreviewProvider {
 static var previews: some View {
 TempFipView()
 }
 }*/
