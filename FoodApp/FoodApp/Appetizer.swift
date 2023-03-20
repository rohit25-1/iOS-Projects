//
//  Appetizer.swift
//  FoodApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import Foundation

struct Appetizer: Decodable, Hashable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 001, name: "Teno", description: "Temp", price: 100, imageURL: "temp", calories: 100, protein: 100, carbs: 100)
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
