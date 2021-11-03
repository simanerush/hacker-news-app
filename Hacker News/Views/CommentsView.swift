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
        NavigationView {
            List(networkManager.comments) { comment in
                VStack {
                    Text(comment.author)
                    Text(comment.comment_text)
                }
                
            }
        }
        .navigationBarTitle("𝗰𝗼𝗺𝗺𝗲𝗻𝘁𝘀")
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
        CommentsView(storyId: "29082060")
    }
}

