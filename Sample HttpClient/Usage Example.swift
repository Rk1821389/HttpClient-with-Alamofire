////
////  Usage Example.swift
////  Sample HttpClient
////
////  Created by Manoj kumar on 16/02/23.
////
//
//import Foundation
//
//class User {
//    var name: String
//    var email: String
//
//    init(name: String, email: String) {
//        self.name = name
//        self.email = email
//    }
//}
//
//extension User: Encodable {
//    enum CodingKeys: String, CodingKey {
//        case name
//        case email
//    }
//}
//
//struct Book: Codable {
//    let title: String
//    let author: String
//}
//
//func Usage() {
//
//    //MARK: GET REQUEST
//    HttpClient.shared.get(url: "https://myapi.com/books", parameters: nil, headers: nil) { (result: Result<[Book], Error>) in
//        switch result {
//        case .success(let books):
//            print("Received books: \(books)")
//        case .failure(let error):
//            print("Error: \(error.localizedDescription)")
//        }
//    }
//
//
//    //MARK: POST USING DISCTIONAY
//
//    let params = ["name": "John", "age": 30]
//
//    HttpClient.shared.post(url: "https://myapi.com/users", parameters: params, headers: nil) { (result: Result<Data, Error>) in
//        switch result {
//        case .success(let data):
//            let responseString = String(data: data, encoding: .utf8)
//            print("Received response: \(responseString)")
//        case .failure(let error):
//            print("Error: \(error.localizedDescription)")
//        }
//    }
//
//
//
//    //MARK: Using a custom object with the put method:
//
//    let user = User(name: "John", email: "john@example.com")
//
//    let encoder = JSONEncoder()
//    let params = try? encoder.encode(user)
//
//    HttpClient.shared.put(url: "https://myapi.com/users/1", parameters: params, headers: nil) { (result: Result<Data, Error>) in
//        switch result {
//        case .success(let data):
//            let responseString = String(data: data, encoding: .utf8)
//            print("Received response: \(responseString)")
//        case .failure(let error):
//            print("Error: \(error.localizedDescription)")
//        }
//    }
//
//}
//
//
