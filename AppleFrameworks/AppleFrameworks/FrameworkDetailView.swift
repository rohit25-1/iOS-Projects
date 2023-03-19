//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Rohit Sridharan on 19/03/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Binding var isDisplayed : Bool
    let detailContent: Framework
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    isDisplayed = false
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                })
                .padding()
            }
            

            frameworkIconRender(imageName: detailContent.imageName, name: detailContent.name)
                .padding(20)
            Text(detailContent.description)
                .font(.body)
            Spacer()
            Button(action: {
                print("Hello")
            }, label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 240, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.padding()
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(isDisplayed: .constant(false), detailContent: Framework(name: "App Clip", imageName: "app-clip", urlString: "https://developer.apple.com/app-clips", description: "App Clips are a great way for users to quickly access and experience what your app has to offer. An App Clip is a small part of your app that’s discoverable at the moment it’s needed. App Clips are fast and lightweight so a user can open them quickly.\n\nWhether they're ordering take-out from a restaurant, renting a scooter, or setting up a new connected appliance for the first time, users will be able to start and finish an experience from your app in seconds. And when they’re done, you can offer the opportunity to download your full app from the App Store."))
            .preferredColorScheme(.dark)
    }
}
