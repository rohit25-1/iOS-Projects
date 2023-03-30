//
//  NotesSheetView.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct NotesSheetView: View {
    @State var notesData : NotesModel
    @Binding var isDisplayed : Bool
    @EnvironmentObject var notesObject : NotesRequest
    var body: some View {

        NavigationStack {
            VStack{

                TextEditor(text: $notesData.notes)
                    .frame(minHeight: 100)
                    .padding()
        
            }
            .navigationTitle(notesData.title)
            .toolbar(content: {
                Button(action: {
                    notesObject.deletePostRequest(notesData: notesData)
                    isDisplayed = false
                }, label: {
                    Image(systemName: "trash")
                        .accentColor(.red)
                })
            })
            .toolbar(content: {
                Button(action: {
                    notesObject.updatePostRequest(notesData: notesData)
                    isDisplayed = false
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                        
                })
            })
        }
    }
}




struct NotesSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NotesSheetView(notesData: NotesModel(title: "test", _id: "1", notes: "test"), isDisplayed: .constant(false))
    }
}
