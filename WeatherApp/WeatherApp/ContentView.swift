//
//  ContentView.swift
//  WeatherApp
//
//  Created by Rohit Sridharan on 09/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var darkMode = false;
    var body: some View {
        ZStack{
            LinearGradient(colors: [(darkMode ? Color("upperdarkBlue"): .blue) ,
                                    (darkMode ? Color("darkBlue") :  Color("lightBlue"))],
                          startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
            VStack(spacing: 50){
                CustomText(content:"Bengaluru, KA", fontsize: 35, fontweight: .bold, fontcolor: .white)
                WeatherImages(weather: "moon.stars.fill", width: 180, height: 180)
                    .shadow(color: .white,radius: 3.6)
                
                CustomText(content: "38°C", fontsize: 60, fontweight: .bold, fontcolor: .white)
                HStack(spacing: 15){
                    VStack{
                        CustomText(content: "MON", fontsize: 15, fontweight: .semibold, fontcolor: .white)
                        WeatherImages(weather: "sun.dust.fill", width: 45, height: 45)
                        CustomText(content: "32°", fontsize: 20, fontweight: .semibold, fontcolor: .white)
                    }
                    VStack{
                        CustomText(content: "TUE", fontsize: 15, fontweight: .semibold, fontcolor: .white)
                        WeatherImages(weather: "cloud.drizzle.fill", width: 45, height: 45)
                        CustomText(content: "38°", fontsize: 20, fontweight: .semibold, fontcolor: .white)
                    }
                    VStack{
                        CustomText(content: "WED", fontsize: 15, fontweight: .semibold, fontcolor: .white)
                        WeatherImages(weather: "cloud.sun.rain.fill", width: 45, height: 45)
                        CustomText(content: "39°", fontsize: 20, fontweight: .semibold, fontcolor: .white)
                    }
                    VStack{
                        CustomText(content: "THU", fontsize: 15, fontweight: .semibold, fontcolor: .white)
                        WeatherImages(weather: "cloud.sun.bolt.fill", width: 45, height: 45)
                        CustomText(content: "43°", fontsize: 20, fontweight: .semibold, fontcolor: .white)
                    }
                    VStack{
                        CustomText(content: "FRI", fontsize: 15, fontweight: .semibold, fontcolor: .white)
                        WeatherImages(weather: "cloud.moon.rain.fill", width: 45, height: 45)
                        CustomText(content: "28°", fontsize: 20, fontweight: .semibold, fontcolor: .white)
                    }
                    VStack{
                        CustomText(content: "SAT", fontsize: 15, fontweight: .semibold, fontcolor: .white)
                        WeatherImages(weather: "cloud.sun.rain.fill", width: 45, height: 45)
                        CustomText(content: "34°", fontsize: 20, fontweight: .semibold, fontcolor: .white)
                    }
                }.padding(.all, 30)
                .border(.white)
                .cornerRadius(20)
                    
                Button{
                   print("Tapped")
                    darkMode=(!darkMode)
                }label: {
                    CustomText(content: "Switch Mode", fontsize: 20, fontweight: .bold, fontcolor: .black)
                }.frame(width: 250, height: 50, alignment: .center)
                    .background(Color(.white))
                    .opacity(0.8)
                    .cornerRadius(20)
                    .blur(radius: 0.4)
                    .shadow(radius: 10)
                
                
                    
            }
        }
    }
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

struct WeatherImages: View {
    var weather:String
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        Image(systemName: weather)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: self.width, height: self.height, alignment: .center)
    }
}
