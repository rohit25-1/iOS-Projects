//
//  FrameworkViewModel.swift
//  AppleFrameworks
//
//  Created by Rohit Sridharan on 19/03/23.
//

import SwiftUI


final class FrameworkViewModel : ObservableObject{
    var selectedFramework : Framework?{
        didSet{
            isDisplayed = true
        }
    }
    @Published var isDisplayed = false

}
