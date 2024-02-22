//
//  SnackTypes.swift
//  SnacksApp
//
//  Created by Rohit Sridharan on 11/10/23.
//

import Foundation



struct SnackTypesModel:Identifiable, Hashable{
    var id = UUID()
    var icon: String?
    var name: String
}



var SnackTypes:[SnackTypesModel] = [
    SnackTypesModel(name: "All"),
    SnackTypesModel(icon: "hockey.puck.fill", name: "Choco"),
    SnackTypesModel(icon: "atom", name: "Waffle"),
    SnackTypesModel(icon: "target", name: "Candy")
]
