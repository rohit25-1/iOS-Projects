//
//  ContentView.swift
//  LearnAsyncAwait
//
//  Created by Rohit Sridharan on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var data : APIModel = APIModel(message: "", status: "")
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: data.message)){Im
                
            }
                
        
                
                
            
            
            
            Button {
                Task{
                    do{
                        data = try await callAPI()
                    }
                    catch{
                        print(error)
                    }
                }
            } label: {
                Text("Click Me")
            }

        }
        .padding()
    }
}

struct APIModel: Codable{
    let message: String
    let status: String
}


func callAPI() async throws ->APIModel{
    do{
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(APIModel.self, from: data)
        return decodedData
    }
    catch{
        print(error)
        throw error
    }
    
}





#Preview {
    ContentView()
}
