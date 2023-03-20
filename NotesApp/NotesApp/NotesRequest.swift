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
        makeRequest()
    }
    @Published var isOpen = false
    @Published var notes:[NotesModel] = []
    var currentNote : NotesModel?{
        didSet{
            isOpen = true
        }
    }
    func makeRequest()
    {
        let url = "http://localhost:3000/notes"
        AF.request(url,method: .get).response{ response in
            switch response.result{
            case .success:
                do{
                    let json = try JSON(data: response.data!)
                    self.notes.removeAll()
                    for (_,ele) in json{
                        let note = NotesModel(title: ele["title"].stringValue, _id: ele["_id"].stringValue, notes: ele["notes"].stringValue)
                        self.notes.append(note)
                    }
                }
                catch{
                    print(error)
                }
            case .failure:
                print(response.error ?? "Server Error")
                
            }
        }
    }
}



