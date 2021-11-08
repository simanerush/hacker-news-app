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
    var comment_text: String
    
    enum CodingKeys: String, CodingKey {
        case objectID
        case story_id
        case author
        case comment_text
        
    }

}

extension Comment {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        objectID = try values.decode(String.self, forKey: .objectID)
        story_id = try values.decode(Int.self, forKey: .story_id)
        author = try values.decode(String.self, forKey: .author)
        comment_text = try values.decode(String.self, forKey: .comment_text).htmlToString
    }
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
