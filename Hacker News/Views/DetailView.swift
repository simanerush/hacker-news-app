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
    var title: String
    
    var body: some View {
        
        // Display a Web View
        WebView(urlString: url)
        
        NavigationLink(destination: CommentsView(storyId: id, storyTitle: title), label: {
            Text("View Comments")
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "", id: "", title: "")
    }
}
