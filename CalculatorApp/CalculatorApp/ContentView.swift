//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Rohit Sridharan on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var displayNum = ""
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    CustomText(content: "\(displayNum)", fontsize: 90, fontweight: .bold, fontcolor: .black)
                        .frame(width: 250, height: 250, alignment: .center)
                }
                
                Spacer()
                VStack{
                    HStack(spacing: 10){
                        Button{
                            displayNum = ""
                        }label: {
                            CustomText(content: "AC", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(12)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color(.white))
                            .cornerRadius(50)
                        
                        Button{
                            
                        }label: {
                            CustomText(content: "C", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(12)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color(.white))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum = ""
                        }label: {
                            CustomText(content: "%", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(12)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color(.white))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "÷"
                        }label: {
                            CustomText(content: "÷", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(12)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("purple"))
                            .cornerRadius(50)
                    }
                    
                    
                    HStack{
                        Button{
                            displayNum += "7"
                        }label: {
                            CustomText(content: "7", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "8"
                        }label: {
                            CustomText(content: "8", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "9"
                        }label: {
                            CustomText(content: "9", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "x"
                        }label: {
                            CustomText(content: "x", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("purple"))
                            .cornerRadius(50)
                    }
                    
                    HStack{
                        Button{
                            displayNum += "4"
                        }label: {
                            CustomText(content: "4", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "5"
                        }label: {
                            CustomText(content: "5", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "6"
                        }label: {
                            CustomText(content: "6", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "-"
                        }label: {
                            CustomText(content: "-", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("purple"))
                            .cornerRadius(50)
                    }
                    
                    HStack{
                        Button{
                            displayNum += "1"
                        }label: {
                            CustomText(content: "1", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "2"
                        }label: {
                            CustomText(content: "2", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "3"
                        }label: {
                            CustomText(content: "3", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "+"
                        }label: {
                            CustomText(content: "+", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("purple"))
                            .cornerRadius(50)
                    }
                    
                    HStack{
                        Button{
                            displayNum += "0"
                            
                        }label: {
                            CustomText(content: "0", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,65)
                        }.frame(width: getWidth()*2, height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "."
                        }label: {
                            CustomText(content: ".", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("orange"))
                            .cornerRadius(50)
                        
                        Button{
                            displayNum += "="
                        }label: {
                            CustomText(content: "=", fontsize: 30, fontweight: .bold, fontcolor: .black)
                                .padding(.horizontal,25)
                        }.frame(width: getWidth(), height: 70, alignment: .center)
                            .background(Color("purple"))
                            .cornerRadius(50)
                    }
                
                }.shadow(color: .purple.opacity(0.8), radius: 30, x: 0, y: 0)
                
            }.padding(.bottom)
            .ignoresSafeArea()
            
        }

    }
}

func getWidth() ->CGFloat{
    return (UIScreen.main.bounds.width-(10*5))/4
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CustomText: View {
    var content: String
    var fontsize: CGFloat
    var fontweight:Font.Weight
    var fontcolor: Color
    var body: some View {
        Text(content)
            .font(.system(size: fontsize, weight:fontweight, design: .default ))
            .foregroundColor(fontcolor)
    }
}
