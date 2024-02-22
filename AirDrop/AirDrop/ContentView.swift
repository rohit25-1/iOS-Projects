//
//  ContentView.swift
//  AirDrop
//
//  Created by Rohit Sridharan on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Image(systemName: "apple.logo")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                        
                    Text("AirDrop")
                        .font(.title)
                        .fontWeight(.bold)
                }.padding()
                
                Button(action: {}, label: {
                    Text("Send")
                        .frame(width: 100, height: 30, alignment: .center)
                })
                
                Button(action: {}, label: {
                    Text("Receive")
                        .frame(width: 100, height: 30, alignment: .center)
                })
                
                
            }
            .padding()
        }
    }
        
}

#Preview {
    ContentView()
}
