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
    var body: some View {

        NavigationStack {
            VStack{

                TextEditor(text: $notesData.notes)
                    .frame(minHeight: 100)
                    .padding()
        
                    Spacer()
                Button(action: {
                    let url = URL(string: "http://localhost:3000/update-notes")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    let parameters = ["notes": notesData.notes, "title": notesData.title]
                    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    let session = URLSession.shared
                    let task = session.dataTask(with: request) { data, response, error in
                        // handle response
                    }
                    task.resume()
                    isDisplayed = false
                    
                }, label: {
                    Text("Update")
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
            .toolbar(content: {
                Button(action: {
                    let url = URL(string: "http://localhost:3000/delete-notes")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    let parameters = ["_id": notesData._id]
                    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    let session = URLSession.shared
                    let task = session.dataTask(with: request) { data, response, error in
                    }
                    task.resume()
                    isDisplayed = false
                }, label: {
                    Image(systemName: "trash")
                        .accentColor(.red)
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
