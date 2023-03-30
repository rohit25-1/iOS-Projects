//
//  SwiftUIView.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 22/03/23.
//

import SwiftUI

struct CreateNotesView: View {
    @State var notesData : NotesModel
    @Binding var isDisplayed : Bool
    @EnvironmentObject var notesObject : NotesRequest
    var body: some View {

        NavigationStack {
            VStack{
                TextEditor(text: $notesData.notes)
                    .frame(minHeight: 100)
                    .padding()
                    Spacer()
                Button(action: {
                    notesObject.createNotesPost(notesData: notesData)
                    isDisplayed = false
                    
                }, label: {
                    Text("Add Note")
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(color: Color("darkGray"), radius: 10, x: 0, y: 4)
                        .padding()
                })
            }
            .navigationTitle(notesData.title)
                
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNotesView(notesData: NotesModel(title: "test", _id: "1", notes: "test"), isDisplayed: .constant(false))
    }
}
