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
            List(networkManager.posts) { post in NavigationLink(destination: DetailView(url: post.url)) {
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
                
            }
            .navigationBarTitle("ｎｅｗｓ👾")
        }
        
        // What should be done before view appears
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
