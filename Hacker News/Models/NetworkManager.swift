//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import Foundation

// Networking!
class NetworkManager: ObservableObject {
    
    // Publish posts & comments to any listeners when update occurs
    @Published var postsIds = Ids()
    
    @Published var comments = [Comment]()
    
    func fetchPosts() {
        
        // API access (if let, because of optional)
        if let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    // Start decoding
                    if let safeData = data {
                        do {
                            let resultsIds = try decoder.decode(Ids.self, from: safeData)
                            DispatchQueue.main.async {
                                // Update must happen in a main thread
                                self.postsIds = resultsIds
                                print(self.postsIds)
                            }
                        }  catch {
                            print(error)
                        }
                    }
                }
            }
            // Continue the networking task
            task.resume()
        }
    }
    
    func fetchCommentsForPost(postId: String) {
        // API access (if let, because of optional)
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=comment,story_\(postId)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    // Start decoding
                    if let safeData = data {
                        do {
                            let commentsResults = try decoder.decode(CommentsResults.self, from: safeData)
                            DispatchQueue.main.async {
                                // Update must happen in a main thread
                                self.comments = commentsResults.hits
                                print(self.comments)
                            }
                        }  catch {
                            print(error)
                        }
                    }
                }
            }
            // Continue the networking task
            task.resume()
        }
    }
    
}
