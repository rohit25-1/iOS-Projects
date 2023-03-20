//
//  AccountView.swift
//  FoodApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView{
            Text("Account")
                .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
