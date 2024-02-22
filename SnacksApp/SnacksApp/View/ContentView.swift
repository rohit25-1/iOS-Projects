//
//  ContentView.swift
//  SnacksApp
//
//  Created by Rohit Sridharan on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
            SnackTypesScroll()
            SelectAll()
            Spacer()
            DisplaySnack()
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct Header: View {
    var body: some View {
        HStack{
            Text("Order From The Best Of **Snacks**")
                .font(.title)
                .fontWeight(.medium)
                .padding()
                .lineSpacing(10.0)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(Color.black)
                    .overlay(content: {
                        Capsule(style: .circular)
                            .stroke()
                            .frame(width: 50, height: 70)
                            .foregroundStyle(Color.gray)
                        
                    })
                    .padding()
            }
            
        }
    }
}

struct SnackTypesScroll: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(SnackTypes){ snack in
                    HStack{
                        if (snack.icon != nil){
                            Image(systemName: snack.icon!)
                            Text(snack.name)
                                .fontWeight(.semibold)
                        }
                        else{
                            Text(snack.name)
                                .fontWeight(.semibold)
                        }
                    }.padding()
                        .background(.myGray)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    
                }
            }.padding(.vertical)
            
        }.scrollIndicators(.hidden)
    }
}

struct SelectAll: View {
    var body: some View {
        HStack{
            Text("Choco **Collections**")
                .font(.title2)
                .padding()
            Spacer()
            Image(systemName: "arrow.right")
                .padding()
        }
    }
}

struct DisplaySnack: View {
    var body: some View {
        ZStack(alignment: .leading){
            Color(.myPink)
            Image(.image1)
                .rotationEffect(.degrees(45))
                .offset(x: 100, y: 80)
            VStack(alignment: .leading){
                Text("Good Source")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(10)
                Text("Choco")
                    .fontWeight(.bold)
                    .padding(10)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding()
                Spacer()
                HStack{
                    Spacer()
                    HStack{
                        Text("$8.0")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        Image(systemName: "basket")
                            .foregroundStyle(Color.white)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.black).frame(width: 40, height: 40))
                            .padding()
                    }.frame(width: 250, height: 60)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    Spacer()
                }
                
                
            }
            .padding()
        }.frame(width: 350, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
