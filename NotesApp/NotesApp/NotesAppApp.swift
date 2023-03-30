//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject var notesObject = NotesRequest()
    var body: some Scene {
        WindowGroup {
            NotesView()
                .environmentObject(notesObject)
        }
    }
}
