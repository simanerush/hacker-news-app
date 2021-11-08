//
//  KidsData.swift
//  Hacker News
//
//  Created by Serafima on 11/7/21.
//

import Foundation

struct KidsIdsResults: Decodable, Identifiable {
    let id: Int
    var kids: [Int]
    
    init() {
        self.id = 1
        self.kids = []
    }
}
