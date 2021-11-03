//
//  CommentsData.swift
//  Hacker News
//
//  Created by Serafima on 11/2/21.
//

import Foundation

// Helper structs to decode JSON data
struct CommentsResults: Decodable {
    let hits: [Comment]
}

// Identifiable makes the List be able to identify the order of Post objects
struct Comment: Decodable, Identifiable {
    var id: String {
        // Since Identifiable protocol requires an id, we can make this property by just returning objectID that's provided in JSON data
        return objectID
    }
    let objectID: String
    let story_id: Int
    let author: String
    let comment_text: String
}
