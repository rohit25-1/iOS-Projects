//
//  NotesModel.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import Foundation
import SwiftyJSON
import Alamofire


class NotesRequest : ObservableObject{
    
    init() {
        makeGetRequest()
    }
    @Published var isOpen = false
    @Published var notes:[NotesModel] = []
    @Published var currentNote = NotesModel(title: "demo", _id: "001", notes: "demo")
    func makeGetRequest()
    {
        let url = URL(string: "http://localhost:3000/notes")!
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            // handle the response here
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data returned")
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do{
                let decoder = JSONDecoder()
                self.notes = try decoder.decode([NotesModel].self, from: data)
                print(self.notes)
            }
            catch{
                print("Error decoding JSON: \(error)")
            }
            
        }.resume()
            
    }
    
}



