//
//  NotesSheetView.swift
//  NotesApp
//
//  Created by Rohit Sridharan on 20/03/23.
//

import SwiftUI

struct NotesSheetView: View {
    @State var notesData : NotesModel
    var body: some View {

        NavigationStack {
            VStack{
                    HStack(alignment: .top){
                        TextField(notesData.title, text: $notesData.notes)
                            .textFieldStyle(.automatic)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer()
                    }
        
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
                
        }
    }
}




struct NotesSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NotesSheetView(notesData: NotesModel(title: "test", _id: "1", notes: "test"))
    }
}
