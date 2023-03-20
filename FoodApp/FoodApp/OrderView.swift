//
//  OrderView.swift
//  FoodApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Orders")
                .navigationTitle("Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
