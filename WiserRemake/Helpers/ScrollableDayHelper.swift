//
//  ScrollableDayHelper.swift
//  WiserRemake
//
//  Created by Adrien Surugue on 19/09/2021.
//

import SwiftUI

struct ScrollableDayHelper: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HStack(spacing: 45) {
                    Button(action: {
                        print("1")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("L")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                    Button(action: {
                        print("2")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("M")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                    Button(action: {
                        print("3")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("M")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                    Button(action: {
                        print("4")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("J")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                    Button(action: {
                        print("5")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("V")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                    Button(action: {
                        print("6")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("S")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                    Button(action: {
                        print("7")
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            Text("D")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    })
                }
                .padding(.vertical)
            }
            .padding(.top)
            Divider()
            Spacer()
        }
    }
}
struct ScrollableDayHelper_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableDayHelper()
    }
}
