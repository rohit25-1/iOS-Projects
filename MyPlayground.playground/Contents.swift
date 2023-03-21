import UIKit

struct MyStruct: Decodable{
    var _id : String
    var title: String
    var notes: String
}
let myData = [MyStruct]()

let url = URL(string: "http:localhost:3000/notes")!
let session = URLSession.shared
let task = session.dataTask(with: url) { data, response, error in
    // handle the response here
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    guard let data = data else {
        print("No data returned")
        return
    }
    print(String(data: data, encoding: .utf8)!)
    do{
        let decoder = JSONDecoder()
        let myStruct = try decoder.decode([MyStruct].self, from: data)
        print(myStruct)
    }
    catch{
        print("Error decoding JSON: \(error)")
    }
    
}

// start the task
task.resume()
