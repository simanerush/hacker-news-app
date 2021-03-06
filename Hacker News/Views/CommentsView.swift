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
    var storyTitle: String
    
    var body: some View {
        List(networkManager.comments) { comment in
            VStack(alignment: .leading) {
                Text(comment.author).fontWeight(.bold)
                Text(comment.comment_text)
            }
        }
        .navigationTitle(storyTitle)
        .refreshable {
            self.networkManager.fetchCommentsForPost(postId: storyId)
        }
        .onAppear {
            self.networkManager.fetchCommentsForPost(postId: storyId)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(storyId: "29082060", storyTitle: "")
    }
}

