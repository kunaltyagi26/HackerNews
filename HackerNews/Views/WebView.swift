//
//  WebView.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 08/11/20.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else { fatalError("Invalid URL") }
        let urlRequest = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(urlRequest)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
