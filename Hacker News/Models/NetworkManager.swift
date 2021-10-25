//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import Foundation

// Networking!
class NetworkManager {
    
    func fetchData() {
        
        // API access (if let, because of optional)
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                        }  catch {
                            print(error)
                        }
                    }
                }
            }
            // Start networking task
            task.resume()
        }
    }
}
