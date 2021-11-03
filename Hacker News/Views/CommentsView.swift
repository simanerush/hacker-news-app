//
//  CommentsView.swift
//  Hacker News
//
//  Created by Serafima on 11/2/21.
//

import SwiftUI

struct CommentsView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var storyId: String
    
    var body: some View {
        List {
            VStack {
                Text("Author")
                Text("Comment")
            }
        }
        .refreshable {
            self.networkManager.fetchCommentsForPost(postId: storyId)
        }
        .onAppear {
            print(storyId)
            self.networkManager.fetchCommentsForPost(postId: storyId)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(storyId: "29082060")
    }
}

