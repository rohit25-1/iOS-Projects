//
//  ItemBox.swift
//  ShoppingAppUIUX
//
//  Created by Rohit Sridharan on 26/01/24.
//

import SwiftUI

struct ItemBox: View {
    
    let price: String
    let image: String
    let name: String
    let width: CGFloat = (UIScreen.main.bounds.width/2) - 20
    var body: some View {
        VStack{
            HStack{
                HStack(spacing:1){
                    Text("$")
                        .foregroundStyle(.mint)
                        .bold()
                    Text("\(price)")
                        .bold()
                }.padding()
                
                Spacer()
                Image(systemName: "heart")
                    .foregroundStyle(.red)
                    .padding()
                    .bold()
            }
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: width-30, alignment: .center)
            
            HStack{
                Text(name)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .multilineTextAlignment(.leading)
                    .padding()
                    Spacer()
            }
            
            
            
            
        }.frame(width:width , height: 205, alignment: .center)
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            
    }
}

#Preview {
    ItemBox(price: "180", image: "shoe1", name: "Nike Jordan")
}
