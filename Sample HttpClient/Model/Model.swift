//
//  Model.swift
//  Sample HttpClient
//
//  Created by Manoj kumar on 16/02/23.
//

import Foundation


struct Model: Decodable {

    let count: String?
    let entries: [Entries]?

   

}


struct Entries: Decodable {

    let API: String?
    let Description: String?
    let Auth: String?
    let HTTPS: Bool?
    let Cors: String?
    let Link: String?
    let Category: String?

  

}
