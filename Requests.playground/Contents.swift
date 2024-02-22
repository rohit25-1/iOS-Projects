import SwiftUI


struct credentials: Codable
{
    var _id : String
    var email : String
    var password : String
}

struct LoginParameters : Codable{
//    var _id : String
//    var email : String
    var name : String
//    var password : String
    var username : String?
    var tweets : [String]?
}



func getAPI() async
{
    guard let url = URL(string: "http://localhost:3000/all")
    else{
        print("URL Error")
        return
    }
    do{
        let (data,_) = try await  URLSession.shared.data(from: url)
        let receivedData = try JSONDecoder().decode([credentials].self, from: data)
        print(receivedData)
    }
    catch{
        print(error)
    }
    
}

func postAPI() async{
    guard let url = URL(string: "http://localhost:3000/register")
    else{
        print("Invalid URL")
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    var requestBody : credentials = credentials(_id: "01", email: "rajsree102@gmail1.com", password: "Rajsri")
    do{
        request.httpBody = try JSONEncoder().encode(requestBody)
    }catch{
        print(error)
    }
    
    do{
        let (data,response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        if httpResponse.statusCode != 200 {
            print("Error Registering")
            return
        }
        let responseData = try JSONDecoder().decode(credentials.self, from: data)
        print(responseData)
    }catch{
        print(error)
    }
    
}


func allTweetData() async
{
    let url = URL(string: "http://localhost:3000/all")!
    
    do{
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode([LoginParameters].self, from: data)
        print(decodedData)
    }catch{
        print(error)
    }
}



//Task{
//    await allTweetData()
//}
//
