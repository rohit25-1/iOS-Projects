//
//  ContentView.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var notesObject = NotesRequest()
    @State private var newNoteTitle = ""
    @State private var showAlert = false
    @State private var newNoteOpen = false
    var body: some View {
        //Loading View
        if notesObject.isLoading{
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(1.2)
        }
        else if notesObject.error != "" {
                    Text(notesObject.error)
                Button(action: {
                    notesObject.makeGetRequest()
                }, label: {
                    Text("Reload")
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(.regularMaterial)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                })
            }
        else{
            NavigationStack{
                VStack{
                        //If No Notes Are Present
                        if(notesObject.notes.isEmpty)
                        {
                            Text("No Notes Available")
                                .fontWeight(.bold)
                                .font(.headline)
                        }
                        else{
                            List(notesObject.notes, id: \._id){ notes in
                                Text(notes.title)
                                    .padding()
                                    .onTapGesture {
                                        notesObject.isOpen = true
                                        notesObject.currentNote = notes
                                    }
                            }
                            .refreshable {
                                notesObject.makeGetRequest()
                                }
                        }
                    }
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Button(action: {
                            // handle plus button action here
                            showAlert = true
                        }) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }.alert("New Note", isPresented: $showAlert) {
                TextField("Enter Title", text: $newNoteTitle)
                Button(action: {
                    newNoteOpen = true
                }, label: {
                    Text("Create Note")
                })
                Button(action: {
                    showAlert = false
                }, label: {
                    Text("Cancel")
                })
            }
            .sheet(isPresented: $notesObject.isOpen, onDismiss: {
                notesObject.makeGetRequest()
            }, content: {
                NotesSheetView(notesData: notesObject.currentNote, isDisplayed: $notesObject.isOpen)
            })
            .sheet(isPresented: $newNoteOpen, onDismiss: {
                notesObject.makeGetRequest()
            }, content: {
                CreateNotesView(notesData: NotesModel(title: newNoteTitle, _id: "", notes: ""), isDisplayed: $newNoteOpen)
            })
        }
        

        
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
