//
//  PostData.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import Foundation

// Helper structs to decode JSON data
struct Results: Decodable {
    let hits: [Post]
}

// Identifiable makes the List be able to identify the order of Post objects
struct Post: Decodable, Identifiable {
    var id: String {
        // Since Identifiable protocol requires an id, we can make this property by just returning objectID that's provided in JSON data
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
