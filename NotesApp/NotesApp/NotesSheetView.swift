//
//  NotesSheetView.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct NotesSheetView: View {
    var notesData : NotesModel
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    Text(notesData.notes)
                        .padding()
                }
                
//                Spacer()
            }
                .navigationTitle(notesData.title)
        }
    }
}

struct NotesSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NotesSheetView(notesData: NotesModel(title: "mockdata", _id: "001", notes: "mockdata"))
    }
}
