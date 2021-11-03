//
//  DetailView.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url: String?
    var id: String
    
    var body: some View {
        NavigationLink(destination: CommentsView(storyId: id), label: {
            Text("View Comments")
        })
        // Display a Web View
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com", id: "1")
    }
}
