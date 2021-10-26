//
//  WebView.swift
//  Hacker News
//
//  Created by Serafima on 10/25/21.
//

import Foundation
import WebKit
import SwiftUI

// Create a SwiftUI view that represents a UIKit view
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
