//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Rohit Sridharan on 18/03/23.
//

import SwiftUI

struct AppleFrameworksView: View {
    @ObservedObject var viewModel = FrameworkViewModel()
    @State var toggle = false
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns:columns){
                        ForEach(frameworks){item in
                            frameworkIconRender(imageName: item.imageName, name: item.name)
                                .onTapGesture {
                                    viewModel.selectedFramework = item
                                    
                                }
                        }
                    }.padding(.vertical,40)
            }
            .navigationTitle("Apple Frameworks")
            .sheet(isPresented: $viewModel.isDisplayed){
                FrameworkDetailView(isDisplayed: $viewModel.isDisplayed, detailContent: viewModel.selectedFramework!)
                    .onAppear {
                            print("isDisplayed = \(viewModel.isDisplayed)")
                        }
                    .onDisappear {
                            print("isDisplayed = \(viewModel.isDisplayed)")
                        }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppleFrameworksView()
            .preferredColorScheme(.dark)
    }
}

struct frameworkIconRender: View {
    let imageName: String
    let name: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
            Text(name)
                .font(.system(size: 19, weight: .bold))
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}
