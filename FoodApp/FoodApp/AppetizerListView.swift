//
//  ContentView.swift
//  FoodApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            
            List(MockData.appetizers, id: \.self){appetizer in
                HStack{
                    Image("blackened-shrimp")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 90)
                        .cornerRadius(8)
                    VStack(alignment: .leading){
                        Text(appetizer.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("₹\(appetizer.price,specifier: "%0.2f")")
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            
                    }.padding(.leading)
                }
                
            }
                .navigationTitle("Appetizers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
