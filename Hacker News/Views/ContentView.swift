//
//  ContentView.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        Text("hi")
            .onAppear {
                self.networkManager.fetchPosts()
            }
//        NavigationView {
//            List(networkManager.posts) { post in NavigationLink(destination: DetailView(url: post.url, id: post.objectID)) {
//                HStack {
//                    Text(String(post.points))
//                    Text(post.title)
//                }
//
//            }.contextMenu {
//                Button("Copy Link", action: {() -> Void in UIPasteboard.general.string = post.url})
//            }
//
//            }
//            .navigationBarTitle("𝗻𝗲𝘄𝘀👾")
//            .refreshable {
//                self.networkManager.fetchPosts()
//            }
//        }
//
//        // What should be done before view appears
//        .onAppear {
//            self.networkManager.fetchPosts()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

