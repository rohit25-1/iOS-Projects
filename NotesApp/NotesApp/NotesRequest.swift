//
//  NotesModel.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import Foundation



class NotesRequest : ObservableObject{
    init() {
        makeGetRequest()
    }
    @Published var isOpen = false
    @Published var notes:[NotesModel] = []
    @Published var currentNote = NotesModel(title: "demo", _id: "001", notes: "demo")
    @Published var error = ""
    @Published var isLoading = true
    
    
    func makeGetRequest()
    {
//        let url = URL(string: "http://192.168.1.9:3000/notes")!
        let url = URL(string: "http://localhost:3000/notes")!
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            // handle the response here
            
            DispatchQueue.main.async {
                self.isLoading = false
                if error != nil {
                    print("error connecting to server")
                    self.error = "Error Connecting To Server"
                    return
                }
                guard let data = data else {
                    print("No data returned")
                    return
                }
                do{
                    self.error = ""
                    let decoder = JSONDecoder()
                    self.notes = try decoder.decode([NotesModel].self, from: data)
                    print(self.notes)
                }
                catch{
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
            
    }
    
    func updatePostRequest(notesData : NotesModel)
    {
        let url = URL(string: "http://localhost:3000/update-notes")!
//        let url = URL(string: "http://192.168.1.9:3000/update-notes")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters = ["notes": notesData.notes, "title": notesData.title]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.makeGetRequest()
            }
        }
        task.resume()
    }
    
    func deletePostRequest(notesData: NotesModel)
    {
//        let url = URL(string: "http://192.168.1.9:3000/delete-notes")!
        let url = URL(string: "http://localhost:3000/delete-notes")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters = ["_id": notesData._id]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.makeGetRequest()
            }
        }
        task.resume()
    }
    
    func createNotesPost(notesData: NotesModel)
    {
//        let url = URL(string: "http://192.168.1.9:3000/notes")!
        let url = URL(string: "http://localhost:3000/notes")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters = ["notes": notesData.notes, "title": notesData.title]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.makeGetRequest()
            }
        }
        task.resume()
    }
}






