//
//  ContentView.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var notesObject = NotesRequest()
    var body: some View {
        NavigationStack{
            if(notesObject.notes.isEmpty)
            {
                Text("No Notes Available")
                    .fontWeight(.bold)
                    .font(.headline)
                    .navigationTitle("Notes")
            }
            else{
                List(notesObject.notes, id: \.id){ notes in
                    Text(notes.title)
                        .padding()
                        .onTapGesture {
                            notesObject.currentNote = notes
                        }
                    
                }
                .refreshable {
                    notesObject.makeRequest()
                }
                .navigationTitle("Notes")
                    
                
            }
                
        }.sheet(isPresented: $notesObject.isOpen)
        {
            NotesSheetView(notesData: notesObject.currentNote!)
        }
        
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
