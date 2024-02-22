//
//  ContentView.swift
//  ShoppingAppUIUX
//
//  Created by Rohit Sridharan on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var findShoesTextBox = ""
    @State private var selectedTabIndex = 0
    let tabItems = ["Nike", "Adidas", "Puma", "Balenciaga", "Converse"]

    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.minty, .myGray], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
               
                VStack {
                    TextField("Find Shoe", text: $findShoesTextBox)
                        .frame(height: 37)
                        .padding(7)
                        .fontWeight(.medium)
                        .padding(.horizontal, 15)
                        .background(.white)
                        .cornerRadius(20)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .foregroundStyle(.mint)
                                .frame(width: 32, height: 32, alignment: .center)
                                .padding()
                                
                        }
                    HStack{
                        Text("Categories")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundStyle(.myPurple)
                            .padding(.vertical,20)
                            
                        Spacer()
                    }
                    HStack(spacing: 17) {
                        ForEach(0..<Int(tabItems.count)) { index in
                            Text(tabItems[index])
                                .font(.callout)
                                .bold()
                                .foregroundColor(selectedTabIndex == index ? .myPurple : .gray)
                                .onTapGesture {
                                    selectedTabIndex = index
                                }
                        }
                    }
                    switch selectedTabIndex {
                                case 0:
                        ScrollView {
                            VStack(spacing:10){
                                HStack{
                                    ItemBox(price: "180", image: "shoe1", name: "Nike Jordan")
                                    ItemBox(price: "175", image: "shoe2", name: "Nike Jordan")
                                }
                                HStack{
                                    ItemBox(price: "190", image: "shoe3", name: "Nike Jordan")
                                    ItemBox(price: "190", image: "shoe4", name: "Nike Jordan")
                                }
                            }.padding(.vertical,30)
                        }.scrollIndicators(.hidden)
                                case 1:
                        ScrollView {
                            VStack(spacing:10){
                                HStack{
                                    ItemBox(price: "190", image: "shoe3", name: "Nike Jordan")
                                    ItemBox(price: "190", image: "shoe4", name: "Nike Jordan")
                                }
                                HStack{
                                    ItemBox(price: "180", image: "shoe1", name: "Nike Jordan")
                                    ItemBox(price: "175", image: "shoe2", name: "Nike Jordan")
                                }
                            }.padding(.vertical,30)
                        }.scrollIndicators(.hidden)
                                case 2:
                        ScrollView {
                            VStack(spacing:10){
                                HStack{
                                    ItemBox(price: "180", image: "shoe1", name: "Nike Jordan")
                                    ItemBox(price: "175", image: "shoe2", name: "Nike Jordan")
                                }
                                HStack{
                                    ItemBox(price: "190", image: "shoe3", name: "Nike Jordan")
                                    ItemBox(price: "190", image: "shoe4", name: "Nike Jordan")
                                }
                            }.padding(.vertical,30)
                        }.scrollIndicators(.hidden)
                                case 3:
                        ScrollView {
                            VStack(spacing:10){
                                HStack{
                                    ItemBox(price: "180", image: "shoe1", name: "Nike Jordan")
                                    ItemBox(price: "175", image: "shoe2", name: "Nike Jordan")
                                }
                                HStack{
                                    ItemBox(price: "190", image: "shoe3", name: "Nike Jordan")
                                    ItemBox(price: "190", image: "shoe4", name: "Nike Jordan")
                                }
                            }.padding(.vertical,30)
                        }.scrollIndicators(.hidden)
                                case 4:
                        ScrollView {
                            VStack(spacing:10){
                                HStack{
                                    ItemBox(price: "190", image: "shoe3", name: "Nike Jordan")
                                    ItemBox(price: "190", image: "shoe4", name: "Nike Jordan")
                                }
                                HStack{
                                    ItemBox(price: "180", image: "shoe1", name: "Nike Jordan")
                                    ItemBox(price: "175", image: "shoe2", name: "Nike Jordan")
                                }
                            }.padding(.vertical,30)
                        }.scrollIndicators(.hidden)
                                default:
                                    EmptyView()
                                }
                }.padding()
                
                VStack{
                    Spacer()
                    HStack(spacing:45){
                        Image(systemName: "house")
                            .foregroundStyle(.mint)
                        Image(systemName: "message")
                            .foregroundStyle(.gray)
                        Image(systemName: "heart")
                            .foregroundStyle(.gray)
                        Image(systemName: "bag")
                            .foregroundStyle(.gray)
                        Image(systemName: "person")
                            .foregroundStyle(.gray)
                    }
                    .frame(width: UIScreen.main.bounds.width-20, height: 65, alignment: .center)
                    .background(Material.regular)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }.padding()
                .ignoresSafeArea()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "line.3.horizontal.decrease")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image("memoji")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45, alignment: .center)
                        .clipShape(Circle())
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
