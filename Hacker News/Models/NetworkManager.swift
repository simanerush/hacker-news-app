//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import Foundation
import Firebase

// Networking!
class NetworkManager: ObservableObject {
    
    var ref: DatabaseReference! = Database.database().reference()
    
//    // Publish posts & comments to any listeners when update occurs
//    @Published var posts = [Post]()
//
//    @Published var comments = [Comment]()
//
//    func fetchPosts() {
//
//        // API access (if let, because of optional)
//        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    // Start decoding
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(Results.self, from: safeData)
//                            DispatchQueue.main.async {
//                                // Update must happen in a main thread
//                                self.posts = results.hits
//                            }
//                        }  catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            // Continue the networking task
//            task.resume()
//        }
//    }
//
//    func fetchCommentsForPost(postId: String) {
//        // API access (if let, because of optional)
//        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=comment,story_\(postId)") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    // Start decoding
//                    if let safeData = data {
//                        do {
//                            let commentsResults = try decoder.decode(CommentsResults.self, from: safeData)
//                            DispatchQueue.main.async {
//                                // Update must happen in a main thread
//                                self.comments = commentsResults.hits
//                                print(self.comments)
//                            }
//                        }  catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            // Continue the networking task
//            task.resume()
//        }
//    }
    
    func fetchPosts() {
        ref.child("v0/topstories").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
          let stories = snapshot.value as? [Int] ?? nil;
        });

    }
}
