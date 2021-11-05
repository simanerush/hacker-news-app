//
//  PostData.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import Foundation

// Helper structs to decode JSON data
typealias Ids = [Int]

// Identifiable makes the List be able to identify the order of Post objects
struct Post: Decodable, Identifiable {
    let id: Int
    let kids: Ids?
    let score: Int
    let url: String?
    let title: String
    init() {
        id = 29110444
        title = ""
        kids = []
        score = 0
        url = nil
    }
}
