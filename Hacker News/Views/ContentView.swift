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
        NavigationView {
            List(networkManager.posts) { post in NavigationLink(destination: WebView(urlString: post.url)) {
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }.contextMenu {
                Button("Copy Link", action: {() -> Void in UIPasteboard.general.string = post.url})
                Button("View Comments"), action: {)
            }
                
            }
            .navigationBarTitle("ｎｅｗｓ👾")
            .refreshable {
                self.networkManager.fetchPosts()
            }
        }
        
        // What should be done before view appears
        .onAppear {
            self.networkManager.fetchPosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
