//
//  NotesModel.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import Foundation
struct NotesModel: Identifiable{
    var id: String{ _id }
    var title: String
    var _id: String
    var notes: String
}
